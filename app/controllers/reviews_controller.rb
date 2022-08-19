class ReviewsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @reviews = Review.where(list_id: @list)
  end

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def set_list
    @review = Review.find(params[:id])
  end

  # GUARDA FORMULARIO

  def review_params
    params.require(:review).permit(:comment)
  end
end
