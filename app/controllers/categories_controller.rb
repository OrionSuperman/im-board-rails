class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def new
  end

  def create
  end

  def show
    cat = Category.where(name: params[:name])
    @category = cat.first
    if session[:user_id]
      @user = User.find(session[:user_id])
      @owned = @user.games
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
