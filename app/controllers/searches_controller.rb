class SearchesController < ApplicationController
  def index
    @results = Search.query(params[:q], [Bookmark, Site])
  end
end
