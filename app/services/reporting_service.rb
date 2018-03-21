class ReportingService
  class << self
    def most_sold_item(params)
      date_range = date_range(params)
      order_items = OrderItem.where(created_at: date_range) if date_range.present?
      order_items ||= OrderItem

      most_sold_item = order_items.group(:menu_item_id).order('count_id DESC').count(:id).keys.first
      menu_item = MenuItem.find_by_id(most_sold_item)

      { item: menu_item.as_json(except: :vendor), restaurant: menu_item.try(:vendor).try(:restaurant) }
    end

    def rejected_orders
      Order.rejected.includes(:profile).collect do |order|
        {
          order_number: order.id, date: formatted_date(order.created_at), amount: order.total,
          customer_name: order.profile.full_name, contact_number: order.profile.mobile_number
        }
      end
    end

    def overall_daily_sales
      sales_orders_reports(Order.all.order('created_at DESC').group_by{ |order| order.created_at.to_date })
    end

    def overall_monthly_sales
      sales_orders_reports(Order.all.order('created_at DESC').group_by{ |order| order.created_at.beginning_of_month })
    end

    def busy_resturants
      busy_resturants = Vendor.where(busy: true).pluck(:restaurant_id)
      return [] unless busy_resturants.present?

      Restaurant.where(id: busy_resturants).collect do |restaurant|
        { name: restaurant.name, busy_time: formatted_time(Time.now), date: formatted_date(Date.today), duration: 0 }
      end
    end

    def delivery_boys
      assignment_hash = {}
      OrderAssignment.includes(user: :profile).includes(:order).each { |assignment|
        assignment_hash[assignment.user_id] = { name: assignment.user.full_name, order_total: assignment.order.total }
      }

      order_assignments = OrderAssignment.all.group_by{ |order_assignment| order_assignment.user_id }
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

    def overall_best_selling_items
      #TODO
    end

    def overall_best_selling_areas
      areas_orders_reports(Order.all.group_by{ |order| order.area_id }, Order.sum(:total))
    end

    private
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
