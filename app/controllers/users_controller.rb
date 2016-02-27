class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/register"
    end
  end

  def new
  end

  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
      @addresses = @user.addresses
    end
    
  end

  def show
    @user = User.find(params[:id])
    @games = @user.games
    @events = @user.events
  end

  def update
    user = User.find(session[:user_id])
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
    if params[:user_id].to_i == session[:user_id].to_i
      user = User.find(session[:user_id])
      user.destroy
      redirect_to '/'
    else
      flash[:errors] =  "There is an error preventing account deletion. Please post a trouble ticket and we will resolve the issue."
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def addgame
    user = User.find(session[:user_id])
    game = Game.find(params[:game_id])
    owns = Usergame.new(user: user, game: game)
    if owns.valid?
      owns.save
      redirect_to :back
    else
      flash[:errors] = "I just don't know what went wrong. Submit a trouble ticket and we'll get this resolved. :)"
      redirect_to :back
    end
  end

  def removegame
    user = User.find(session[:user_id])
    game = Game.find(params[:game_id])
    own = Usergame.where(user: user).where(game: game)
    own.first.destroy
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
