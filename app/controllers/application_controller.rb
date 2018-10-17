class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in_user, :set_locale
  include ApplicationHelper
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  rescue_from CanCan::AccessDenied do | exception |
    # redirect_to root_url, alert: exception.message
    if logged_in?
      if current_user.role == "admin" or current_user.role ==  'umum'
        redirect_to landing_url, notice: exception.message
      elsif current_user.role == "vendor"
        @vendor = Vendor.find_by user_id: current_user.id
        redirect_to vendor_path(@vendor), notice: exception.message
      end
    end
  end

  def logged_in_user
  	if logged_in?
    else
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end

  
end
