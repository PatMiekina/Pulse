class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:destroy]
  before_action :set_event, except: [:destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    if @event.nil?
      @review.user = @user
    else @user.nil?
      @review.event = @event
    end
    if @review.save
      if @review.event
        redirect_to event_path(@event)
      elsif @review.user
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.delete
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :event_id, :reviewer_id, :content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def set_event
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
    end
  end

  def set_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
  end
end
