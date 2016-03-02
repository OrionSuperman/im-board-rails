
class EventsController < ApplicationController
  def index
    if params[:state]
      state = params[:state]
      @events = Event.joins(:eventaddress).where("eventaddresses.state=?", state)
    else

      @events = Event.all
      # @events = Event.joins("LEFT JOIN eventgames ON events.id = eventgames.event_id").select("events.*").joins("LEFT JOIN games ON eventgames.game_id = games.id").select("games.id as gameid").group("games.id").group("events.id")

      # @testing = Event.connection.select_all("
      #   SELECT events.title, events.description, events.time, events.date, events.id AS event_id, games.name, games.id AS game_id
      #   FROM events
      #   LEFT JOIN eventgames
      #   ON events.id = eventgames.event_id
      #   LEFT JOIN games
      #   ON eventgames.game_id = games.id
      #   GROUP BY games.id, events.id
      #   ")

      # @testing2 = Event.connection.select_all("
      #   SELECT events.id as event_id, games.id AS game_id
      #   FROM events
      #   LEFT JOIN eventgames
      #   ON events.id = eventgames.event_id
      #   LEFT JOIN games
      #   ON eventgames.game_id = games.id
      #   GROUP BY games.id, events.id
      #   ")

      # render json: @testing2
    end
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    @event = Event.find(params[:id])

    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new
    @games = Game.all
  end

  def search

  end

  def results
    @events = Events.where(state: params[:state])
  end

  def create

    if params[:event][:open] == "open"
      params[:event][:open] = true
    else
      params[:event][:open] = false
    end
    event = Event.new(event_params)
    
    if event.valid?
      

        # url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:street1]},#{params[:city]},#{params[:state]}&key=AIzaSyBT3Ms__V4YEzpSeksmaDlT_YbUBrKlu9E"
        # result = JSON.parse(open(url).read)

        # render json: result

        # params[:lat] = res

        user = User.find(session[:user_id])
        event.user = user
        event.save
        games = params[:games]
        games.each do |game_id|

          game = Game.find(game_id)
          Eventgame.create(game: game, event: event)
        end
        redirect_to "/events/#{event.id}"
     
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events/new"
    end

  end
  def edit
    @games = Game.all
    @event = Event.find(params[:id])
  end

  def join
    event = Event.find(params[:id])
    user = User.find(session[:user_id])
    joins = Eventuser.new(user: user, event: event, pending: true, accepted: false)
    if joins.valid?
      joins.save
    else
      flash[:errors] = joins.errors.full_messages
    end
    redirect_to "/events/#{event.id}"
  end

  def accept
    event = Event.find(params[:event_id])
    user = User.find(params[:user_id])
    joins = Eventuser.where(user: user, event: event)
    if joins
      join = joins.first
      join.update(accepted: true, pending: false)
    end
    redirect_to "/events/#{event.id}"
  end

  def leave
    event = Event.find(params[:id])
    user = User.find(session[:user_id])
    joins = Eventuser.where(user: user, event: event)
    if joins
      join = joins.first
      join.destroy
    end
    redirect_to "/events/#{event.id}"
  end

  def remove
    event = Event.find(params[:id])
    user = User.find(params[:user_id])
    join = Eventuser.where(user: user, event: event)
    join.first.update(accepted: false, pending: false)
    redirect_to "/events/#{event.id}"
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.valid?
      
        event.save
        
        games = params[:games]
        current = []
        games.each do |game_id|
          game = Game.find(game_id)
          if event.games.include?(game)
            eg = Eventgame.where(game: game, event: event)
            current.push(eg)
          else
            eg = Eventgame.create(game: game, event: event)
            current.push(eg)
          end
        end

        # event.eventgames.each do |link|
        #   if not current.include?(link)
        #     link.destroy
        #   end
        # end
        redirect_to "/events/#{event.id}"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    event = Event.find(params[:id])
    user = User.find(session[:user_id])
    if event.user.id == session[:user_id]
      event.destroy
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = "You are not authorized to delete this event."
      redirect_to "/events/#{event.id}"
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :about, :seats, :open, :date, :time, :user, :street1, :user_id, :street2, :city, :state, :zipcode)
  end

  def address_params
    params.require(:eventaddress).permit(:title, :street1, :user_id, :street2, :city, :state, :zipcode, :lat, :lng)
  end
end
