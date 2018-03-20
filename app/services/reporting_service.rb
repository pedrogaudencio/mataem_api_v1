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

    private
    def date_range(params)
      start_date = Date.parse(params[:start_date]) rescue nil
      end_date = Date.parse(params[:end_date]) rescue nil
      (start_date.beginning_of_day..end_date.end_of_day) if start_date.present? && end_date.present?
    end
  end
end
