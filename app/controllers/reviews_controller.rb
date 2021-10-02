class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]

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
    @review.owner = current_user
    if @review.save
      redirect_to review_path(@review)
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
    params.require(:review).permit(:user_id, :reviewer_id, :content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
