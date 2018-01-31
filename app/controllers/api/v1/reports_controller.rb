class Api::V1::ReportsController < Api::V1::ApiController
  # before_action :set_vendor, only: [:show, :update, :destroy]

  # GET /vendors
  def index
    @vendors = Vendor.all

    render json: @vendors
  end

  # GET /vendors/1
  def show
    render json: @vendor
  end

  def best_selling_area
  # overall and restaurant wise

  end

  def most_selling_items
  # overall and restaurant wise

  end

  def daily_sales
  # overall and restaurant wise

  end

  def monthly_sales
  # overall and restaurant wise

  end

  def best_selling_restaurant

  end

  def mataem_revenue
  # overall and restaurant wise

  end

  def restaurant_performance

  end

  def due_payments
  # overall and restaurant wise

  end

end
