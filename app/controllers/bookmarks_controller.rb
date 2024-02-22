class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new # Needed to instantiate the form_with
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list
    if @bookmark.save
    # No need for app/views/bookmarkss/create.html.erb
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
