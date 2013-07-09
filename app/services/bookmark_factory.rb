module BookmarkFactory
  def self.create(opts)
    opts.reverse_merge! url_shortener: ShortURL
    new_bookmark = Bookmark.new(opts.slice(:url, :tag_list))

    domain = URI.parse(new_bookmark.url).host
    site = Site.where(domain: domain).first ||
      Site.create(domain: domain)

    new_bookmark.shortening = opts[:url_shortener].shorten(new_bookmark.url)
    new_bookmark.site_id  = site.id
    new_bookmark.save!
    new_bookmark
  end
end
