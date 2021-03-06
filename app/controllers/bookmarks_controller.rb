class BookmarksController < ApplicationController
  respond_to(:html)
  expose(:bookmark)
  expose(:bookmarks) do
    if params[:tag].present?
      Bookmark.tagged_with(params[:tag])
    else
      Bookmark.scoped
    end
  end

  def create
    self.bookmark = Bookmark.create_with(params[:bookmark])
    respond_with(bookmark)
  end

  def destroy
    bookmark.destroy
    redirect_to "/bookmarks", notice: "Bookmark removed"
  end
end
