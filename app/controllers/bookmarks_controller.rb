class BookmarksController < ApplicationController
  respond_to(:html)
  expose(:bookmark)

  def index
    if params[:tag]
      @bookmarks = Bookmark.tagged_with(params[:tag])
    else
      @bookmarks = Bookmark.all
    end
  end

  def create
    bookmark.save
    respond_with(bookmark)
  end

  def show

  end

end
