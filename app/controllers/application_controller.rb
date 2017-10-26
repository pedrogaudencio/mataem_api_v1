class ApplicationController < ActionController::API
  # before_action :authenticate_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
end
