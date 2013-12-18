class Admin::ApplicationController < ActionController::Base


  #before_action :require_login

  ADMINTEMPLATE = 'admin'

  layout ADMINTEMPLATE

  protected
  def user_class
    @user_class = ::Administrator
  end

  def auto_login(user)
    session[:admin_id] = user.id
    @current_user = user
  end

  def login_from_session
    @current_user = (user_class.find(session[:admin_id]) if session[:admin_id]) || false
  rescue => exception
    return false if exception.is_a?(ActiveRecord::RecordNotFound)
    raise exception
  end

end
