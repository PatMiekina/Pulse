class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :index]

  def index
    @events = Event.all
  end

  def show
    if current_user.my_events_wishlist.include?(@event)
      @favorite = Favorite.find_by event: @event, owner: current_user
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :location_id, :category, :start_time, :duration)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def find_user
    if params[:user].present?
      @user = User.find(params[:user])
    end
  end
end
