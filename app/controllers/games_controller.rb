class GamesController < ApplicationController
  def index
    @games = Game.all.order(:name)
    if session[:user_id]
      @user = User.find(session[:user_id])
      @owned = @user.games
    end
  end

  def new
  end

  def create
    game = Game.new(game_params)
    if game.valid?
      game.save

      if params[:game][:category]
        category_list = params[:game][:category].downcase.split(',').map(&:strip)

        category_list.each do |name|
          category = Category.new(name: name)

          if category.valid?
            category.save
          else
            category = Category.where(name: name)
          end
           Gamecategory.create(game: game, category: category)

        end

      end


      redirect_to "/games/#{game.id}"
    else
      flash[:errors] = game.errors.full_messages
      redirect_to "/games/new"
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @game = Game.find(params[:id])
    @categories = @game.categories
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    if game.valid?
      game.save

      if params[:game][:category]
        category_list = params[:game][:category].downcase.split(',').map(&:strip)

        category_list.each do |name|
          category = Category.new(name: name)

          if category.valid?
            category.save
          else
            category = Category.where(name: name).first
          end
          if not  game.categories.include?(category)
            Gamecategory.create(game: game, category: category)
          end

        end

      end

      redirect_to "/games/#{game.id}"
    else
      flash[:errors] = game.errors.full_messages
      redirect_to "/games/#{game.id}/edit"
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to '/games'
  end

  private
  def game_params
    params.require(:game).permit(:name, :minplayers, :maxplayers, :length, :description, :about, :image)
  end
end
