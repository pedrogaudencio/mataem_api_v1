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
end
