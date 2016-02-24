class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/"
    end
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.about = params[:about]
    user.description = params[:description]
    if user.valid?
      user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/#{user.id}"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
