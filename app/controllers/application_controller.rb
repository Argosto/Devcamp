class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :change_perm_params, if: :devise_controller?
  
  def change_perm_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  
  end
end
