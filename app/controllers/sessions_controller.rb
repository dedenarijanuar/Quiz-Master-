class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_email] = user.email
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  	session[:user_email] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
