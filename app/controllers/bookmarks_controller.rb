class BookmarksController < ApplicationController
  respond_to(:html)
  expose(:bookmark)

  def create
    bookmark.save
    respond_with(bookmark)
  end

  def show

  end

end
