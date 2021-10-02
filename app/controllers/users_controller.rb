class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :find_event, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @events = @user.my_events
    @wishlist = @user.my_events_wishlist
    @following = @user.my_following
    @friends = @user.my_friends
    if current_user.my_following.include?(@user)
      @favorite = Favorite.find_by user: @user, owner: current_user
    end
    @review = Review.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.delete
  end

  def my_events
    @events = current_user.my_events
    @wishlist = current_user.my_events_wishlist
  end

  def my_friends
    # @friends = []
    # invites = Invite.all
    # invites.each do |invite|
    #   if invite.confirmed && invite.owner == current_user
    #     @friends << invite.attendee
    #   elsif invite.confirmed && invite.attendee == current_user
    #     @friends << invite.owner
    #   end
    # end
    # @favorites = Favorite.all.select { |favorite| favorite.owner == current_user && favorite.user != nil }
    # @following = @favorites.map { |favorite| favorite.user }
    @friends = current_user.my_friends
    @following = current_user.my_following
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :username, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_event
    if params[:event].present?
      @event = Event.find(params[:event])
    end
  end
end
