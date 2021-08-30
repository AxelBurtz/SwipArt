class ReviewsController < ApplicationController

  def new
    @exhibition = Exhibition.find(params[:exhibition_id])
    @review = Review.new
  end  

  def create
    @review = Review.new(review_params)
    @review.exhibition = Exhibition.find(params[:exhibition_id])
    @review.user = current_user
    if @review.save
      redirect_to dashboard_path
    else
      render :new  
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
