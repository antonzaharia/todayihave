class ApplicationController < ActionController::Base
  add_flash_types :message

  helper_method :current_user, :logged_in?
  before_action :redirect_if_not_logged_in

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def redirect_if_not_logged_in
    redirect_to root_path unless logged_in?
  end

  def redirect_from_auth_pages
    redirect_to dashboard_path if logged_in?
  end
end
