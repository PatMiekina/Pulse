class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
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

  private

  def user_params
    params.require(:user).permit(:name, :address, :username, :email)
  end

  def find_user
    @user = User.find(params[:user])
  end
end
