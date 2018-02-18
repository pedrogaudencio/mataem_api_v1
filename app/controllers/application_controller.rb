class ApplicationController < ActionController::API
  # before_action :authenticate_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role, profile_attributes: [:first_name, :last_name, :mobile_number, :status, :address_id, :loyalty_points, :restaurant_id, :gender, :date_of_birth]])
    end
end
