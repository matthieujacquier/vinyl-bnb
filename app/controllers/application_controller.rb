class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name bio city])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name bio city])
  end
end
