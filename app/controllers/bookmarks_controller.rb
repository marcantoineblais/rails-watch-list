class BookmarksController < ApplicationController
  def edit
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @movies = Movie.all
    render 'lists/show'
  end

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

  def update
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    if @bookmark.update(bookmark_params)
      redirect_to list_path(@list)
    else
      @movies = Movie.all
      render :edit
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to list_path(bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
