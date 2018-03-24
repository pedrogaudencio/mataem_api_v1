class Api::V1::ReportsController < Api::V1::ApiController
  # GENERAL REPORTS
  def most_sold_item
    render json: ReportingService.most_sold_item(params)
  end

  # COMMON
  def best_selling_areas
    render json: ReportingService.best_selling_areas(params)
  end

  def best_selling_items
    render json: ReportingService.best_selling_items(params)
  end

  def daily_sales
    render json: ReportingService.daily_sales(params)
  end

  def monthly_sales
    render json: ReportingService.monthly_sales(params)
  end

  # RMA
  def delivery_boys
    render json: ReportingService.delivery_boys(params)
  end

  def busy_resturants
    render json: ReportingService.busy_resturants(params)
  end

  def rejected_orders
    render json: ReportingService.rejected_orders(params)
  end

  # SUA
  def best_selling_resturants
    render json: ReportingService.best_selling_resturants
  end

  def mataem_revenue
    render json: ReportingService.mataem_revenue(params)
  end

  def restaurant_performances
    render json: ReportingService.restaurant_performances
  end

  def due_payments
    render json: ReportingService.due_payments(params)
  end

  def cookies_rewards
    render json: ReportingService.cookies_rewards(params)
  end
end
