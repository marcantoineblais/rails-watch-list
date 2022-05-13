class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @movies = Movie.all
      render 'lists/show'
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
