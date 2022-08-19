class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @review = Review.new
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, photos: [])
  end
end
