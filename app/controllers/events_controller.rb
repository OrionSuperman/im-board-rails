class EventsController < ApplicationController
  def index
    @events = Event.all
    @user = User.find(session[:user_id])
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create

    if params[:event][:open] == "open"
      params[:event][:open] = true
    else
      params[:event][:open] = false
    end
    event = Event.new(event_params)
    if event.valid?
      user = User.find(session[:user_id])
      event.user = user
      event.save
      redirect_to "/events/#{event.id}"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events/new"
    end
  end

  def edit
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

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :about, :seats, :open, :date, :time, :user)
  end
end
