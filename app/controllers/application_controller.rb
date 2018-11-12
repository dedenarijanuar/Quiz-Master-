class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_email]
      @current_user ||= User.where(email: session[:user_email]).first
    else
      @current_user = nil
    end
  end
end
