class Api::V1::ReportsController < Api::V1::ApiController
  # GENERAL REPORTS
  def most_sold_item
    render json: ReportingService.most_sold_item(params)
  end

  # RMA REPORTS
  def overall_best_selling_areas
    render json: ReportingService.overall_best_selling_areas
  end

  def overall_best_selling_items
    render json: ReportingService.overall_best_selling_items
  end

  def overall_daily_sales
    render json: ReportingService.overall_daily_sales
  end

  def overall_monthly_sales
    render json: ReportingService.overall_monthly_sales
  end

  def rejected_orders
    render json: ReportingService.rejected_orders
  end

  def busy_resturants
    render json: ReportingService.busy_resturants
  end

  def delivery_boys
    render json: ReportingService.delivery_boys
  end

  # SUA REPORTS
  def sua_best_selling_areas
    render json: ReportingService.sua_best_selling_areas
  end

  def sua_best_selling_items
    render json: ReportingService.sua_best_selling_items
  end

  def sua_daily_sales
    render json: ReportingService.sua_daily_sales
  end

  def sua_monthly_sales
    render json: ReportingService.sua_monthly_sales
  end

  def best_selling_resturants
    render json: ReportingService.best_selling_resturants
  end

  def mataem_revenue
    render json: ReportingService.mataem_revenue
  end

  def restaurant_performances
    render json: ReportingService.restaurant_performances
  end

  def due_payments
    render json: ReportingService.due_payments
  end

  def cookies_rewards
    render json: ReportingService.cookies_rewards
  end
end
