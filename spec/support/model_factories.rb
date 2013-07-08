module ModelFactories
  def create_bookmark(opts = {})
    opts.reverse_merge! url: "http://example.com"
    Bookmark.create! opts
  end
end
