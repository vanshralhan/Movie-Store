class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
   new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :photo, :dob])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :dob])
  end

  private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
      store_location_for(:user, request.fullpath)
  end

end
