module ModelFactories
  def create_bookmark(opts = {})
    opts.reverse_merge! url: "http://example.com", url_shortener: FakeURLShortener
    Bookmark.create_with opts
  end
end
