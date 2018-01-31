class ApplicationController < ActionController::API
  # before_action :authenticate_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
