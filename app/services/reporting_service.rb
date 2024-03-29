class ReportingService
  class << self
    # GENERAL REPORTS
    def most_sold_item(params)
      date_range = date_range(params)
      order_items = OrderItem.where(created_at: date_range) if date_range.present?
      order_items ||= OrderItem

      most_sold_item = order_items.group(:menu_item_id).order('count_id DESC').count(:id).keys.first
      menu_item = MenuItem.find_by_id(most_sold_item)

      {
        item: menu_item.as_json(except: :vendor, include: [:menu_item_category, :menu_item_cuisine], methods: :image_path ),
        restaurant: menu_item.try(:vendor).try(:restaurant)
      }
    end

    # COMMAN
    def best_selling_items(params)
      vendor_orders = Vendor.find_by(id: params[:vendor_id]).try(:orders) if params[:vendor_id].present?
      order_items = OrderItem.where(order_id: vendor_orders.pluck(:id)) if vendor_orders.present?

      return if params[:vendor_id].present? && order_items.blank?
      order_items ||= OrderItem.all

      order_items = order_items.includes(:order, menu_item: :menu_item_category)
      total_quantity = order_items.sum(&:quantity)

      order_items.group_by{ |item| item.menu_item_id }.collect do |key, items|
        menu_item = items.first.menu_item
        item_quantity = items.sum(&:quantity)
        {
          category: menu_item.menu_item_category.name, item_name: menu_item.name, orders: items.pluck(:order_id).uniq.count,
          total_orders_amount: items.sum(&:price), quantity: item_quantity, sale_percentage: sale_percentage(item_quantity, total_quantity)
        }
      end
    end

    def best_selling_areas(params)
      orders = fetch_orders(params)
      return if orders.blank?

      areas_orders_reports(orders.group_by{ |order| order.area_id }, orders.sum(&:total))
    end

    def daily_sales(params)
      orders = fetch_orders(params)
      return if orders.blank?

      sales_orders_reports(orders.order('created_at DESC').group_by{ |order| order.created_at.to_date })
    end

    def monthly_sales(params)
      orders = fetch_orders(params)
      return if orders.blank?

      sales_orders_reports(orders.order('created_at DESC').group_by{ |order| order.created_at.beginning_of_month })
    end

    #RMA REPORTS
    def delivery_boys(params)
      #TO-DO late delivery mechanism
      return if params[:vendor_id].blank?

      vendor = Vendor.find_by(id: params[:vendor_id])
      return if vendor.blank?

      order_ids = vendor.orders.pluck(:id).uniq
      orders_assignments = OrderAssignment.where(id: order_ids).includes(user: :profile).includes(:order)

      return if orders_assignments.blank?

      assignment_hash = {}
      orders_assignments.each { |assignment|
        assignment_hash[assignment.user_id] = { name: assignment.user.full_name, order_total: assignment.order.total }
      }

      order_assignments = orders_assignments.group_by{ |order_assignment| order_assignment.user_id }
      order_assignments.collect do |user_id, assignment_details|
        assignment = assignment_hash[user_id]
        {
          driver_name: assignment[:name],
          staff_id: user_id,
          total_amount: assignment[:order_total],
          orders_count: assignment_details.count,
          late_delivery: 0,
        }
      end
    end

    def busy_resturants(params)
      #TO-DO keep track of busy/unbusy resturants
      vendor = Vendor.where(id: params[:vendor_id], busy: true).first

      return if vendor.blank?
      Restaurant.where(id: vendor.id).collect do |restaurant|
        { name: restaurant.name, busy_time: formatted_time(Time.now), date: formatted_date(Date.today), duration: 0 }
      end
    end

    def rejected_orders(params)
      return if params[:vendor_id].blank?

      vendor = Vendor.find_by(id: params[:vendor_id])
      return if vendor.blank?

      rejected_orders = vendor.orders.rejected.includes(:profile)

      return if rejected_orders.blank?

      rejected_orders.collect do |order|
        {
          order_number: order.id, date: formatted_date(order.created_at), amount: order.total,
          customer_name: order.profile.full_name, contact_number: order.profile.mobile_number
        }
      end
    end

    # SUA REPORTS
    def restaurant_performances
      ordered_resturants = Restaurant.order('created_at DESC').includes(vendors: :orders).group_by{ |order| order.created_at.beginning_of_month }
      ordered_resturants.collect do |key, resturants|
        order_length = order_sum = 0
        resturants.each do |resturant|
          resturant.vendors.each do |vendor|
            orders = vendor.orders
            order_length = order_length + orders.length
            order_sum = order_sum + orders.sum(&:total)
          end
        end
        { month: key.strftime('%B'), year: key.strftime('%Y'), registered_count: resturants.length, order_amount: order_sum, order_count: order_length }
      end
    end

    def best_selling_resturants
      orders = Order.all.includes(vendor: :restaurant).group_by(&:vendor_id).sort_by{|key, value| -value.count }
      orders.collect do |key, orders_details|
        restaurant = orders_details.first.vendor.restaurant
        {
          date: formatted_date(restaurant.created_at),
          month: restaurant.created_at.strftime('%B'),
          restaurant_name: restaurant.name,
          order_count: orders_details.count,
          total_orders_amount: orders_details.sum(&:total),
          pick_up_orders: orders_details.count{ |order| order.delivery_type.eql?('pickup') },
          delivery_orders: orders_details.count{ |order| order.delivery_type.eql?('delivery') },
          cash_orders: orders_details.count{ |order| order.payment_type.eql?('cod') },
          credit_card_orders: orders_details.count{ |order| order.payment_type.eql?('online') },
        }
      end
    end

    def mataem_revenue(params)
      commission = 0.13

      if params[:vendor_id].present?
        vendor = Vendor.find_by(id: params[:vendor_id])
        return if vendor.blank?

        order_sum = vendor.orders.sum(&:total)
        restaurant = vendor.restaurant
        time = restaurant.created_at
        { month: time.strftime('%B'), year: time.strftime('%Y'), name: restaurant.name, amount: order_sum, commission: order_sum*commission }
      else
        ordered_resturants = Restaurant.order('created_at DESC').includes(vendors: :orders).group_by{ |order| order.created_at.beginning_of_month }

        ordered_resturants.collect do |key, resturants|
          order_sum = 0
          resturants.each{ |r| r.vendors.each{ |v| order_sum = order_sum + v.orders.sum(&:total) }}
          { month: key.strftime('%B'), year: key.strftime('%Y'), registered_count: resturants.length, amount: order_sum, commission: order_sum*commission }
        end
      end
    end

    def due_payments(params)
      # TODO - IMPLEMENT Due amount logic
      commission = 0.13

      vendor = Vendor.find_by(id: params[:vendor_id]) if params[:vendor_id].present?
      return if params[:vendor_id].present? && vendor.blank?

      vendors = [vendor] if vendor.present?
      vendors ||= Vendor.order('created_at DESC').includes(:orders)

      vendors.collect do |vendor|
        order_sum = vendor.orders.sum(&:total)
        restaurant = vendor.restaurant
        time = restaurant.created_at

        { month: time.strftime('%B'), year: time.strftime('%Y'), name: restaurant.name, amount: order_sum, commission: order_sum*commission, due_amount: 0 }
      end
    end

    def cookies_rewards(params)
      # TODO - IMPLEMENT the modules there
      if params[:vendor_id].present?
        vendor = Vendor.find_by(id: params[:vendor_id])
        return if params[:vendor_id].present? && vendor.blank?

        Restaurant.where(id: vendor.id).collect do |restaurant|
          { month: restaurant.created_at.strftime('%B'), restaurant_name: restaurant.name, cookies_earned: 0, cookies_rewarded: 0 }
        end
      else
        Restaurant.all.collect do |restaurant|
          month = restaurant.created_at
          { month: month.strftime('%B'), year: month.strftime('%Y'), registered_resturants: 0,cookies_earned: 0, cookies_rewarded: 0 }
        end
      end
    end

    private

    def fetch_orders(params)
      orders = Vendor.find_by(id: params[:vendor_id]).try(:orders) if params[:vendor_id].present?
      return nil if params[:vendor_id].present? && orders.blank?
      orders ||= Order.all
    end

    def date_range(params)
      start_date = Date.parse(params[:start_date]) rescue nil
      end_date = Date.parse(params[:end_date]) rescue nil
      (start_date.beginning_of_day..end_date.end_of_day) if start_date.present? && end_date.present?
    end

    def formatted_date(date)
      date.strftime("%d-%b-%y") rescue date
    end

    def formatted_time(time)
      Time.now.strftime("%H:%M:%P") rescue time
    end

    def sale_percentage(order_amount, total)
      ((order_amount)/(total).to_f)*100
    end

    def areas_orders_reports(orders, total)
      area_hash = {}
      Area.where(id: orders.keys).includes(:city).each{ |area| area_hash[area.id] = area }

      orders.collect do |key, orders_details|
        area_details = area_hash[key]
        order_amount = orders_details.sum(&:total)
        {
          area_name: area_details.name,
          city: area_details.city.name,
          order_count:orders_details.count,
          total_orders_amount: order_amount,
          sale_percentage: sale_percentage(order_amount, total),
        }
      end
    end

    def sales_orders_reports(orders)
      orders.collect do |key, orders_details|
        {
          date: formatted_date(key),
          month: key.strftime('%B'),
          year: key.strftime('%Y'),
          order_count: orders_details.count,
          total_orders_amount: orders_details.sum(&:total),
          pick_up_orders: orders_details.count{ |order| order.delivery_type.eql?('pickup') },
          delivery_orders: orders_details.count{ |order| order.delivery_type.eql?('delivery') },
          cash_orders: orders_details.count{ |order| order.payment_type.eql?('cod') },
          credit_card_orders: orders_details.count{ |order| order.payment_type.eql?('online') },
        }
      end
    end

  end
end
