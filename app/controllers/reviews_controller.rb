class ReviewsController < ApplicationController
  before_action :set_playground, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.playground = @playground
    @review.user = current_user
    if @review.save
      redirect_to playgrounds_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def set_playground
    @playground = Playground.find(params[:playground_id])
  end
end
