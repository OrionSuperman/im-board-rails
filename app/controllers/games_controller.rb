class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def create
    game = Game.new(game_params)
    if game.valid?
      game.save
      redirect_to "/games/#{game.id}"
    else
      flash[:errors] = game.errors.full_messages
      redirect_to "/games/new"
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def game_params
    params.require(:game).permit(:name, :minplayers, :maxplayers, :length, :description, :about, :image)
  end
end
