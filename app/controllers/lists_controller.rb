class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to :index
  end

  def first_log
    @display = 'block'
    index
    render :index
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
