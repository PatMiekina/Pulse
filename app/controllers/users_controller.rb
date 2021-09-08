class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @events = @user.my_events
    @wishlist = @user.my_wishlist
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
    @wishlist = current_user.my_wishlist
  end

  def my_friends
    @users = []
    @following = []
    rand(3..5).times do
      @users << User.all.sample
      @following << User.all.sample
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :username, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
