class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  helper_method :project_name

  def project_name
    Rails.application.class.parent_name.humanize
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end
end
