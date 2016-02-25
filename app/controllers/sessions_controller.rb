class SessionsController < ApplicationController
  def index
  end

  def create
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = ['Invalid Email/Password']
      redirect_to '/'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
