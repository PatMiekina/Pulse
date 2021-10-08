class FavoritesController < ApplicationController
  before_action :find_event, :find_user, only: [:add_to_wishlist, :destroy]
  before_action :find_favorite, only: [:destroy]

  def new
    @favorite = Favorite.new
  end

  def create
  end

  def add_to_wishlist
    @favorite = Favorite.new()
    @favorite.owner = current_user
    if @event.nil?
      @favorite.user = @user
    else @user.nil?
      @favorite.event = @event
    end
    if @favorite.save
      if @event.present?
        redirect_to event_path(@event)
      elsif @user.present?
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    @favorite.delete
    if @event.present?
      redirect_to event_path(@event)
    elsif @user.present?
      redirect_to user_path(@user)
    end
  end

  private

  def find_event
    if params[:event].present?
      @event = Event.find(params[:event])
    end
  end

  def find_user
    if params[:user].present?
      @user = User.find(params[:user])
    end
  end

  def find_favorite
    @favorite = Favorite.find(params[:id])
  end
end
