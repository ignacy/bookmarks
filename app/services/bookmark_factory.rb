module BookmarkFactory
  def self.create(opts)
    shortener = opts.fetch(:url_shortener) { ShortURL }
    bookmark = Bookmark.new(opts.slice(:url, :tag_list))

    if bookmark.url.present?
      unless bookmark.url[/^https?:\/\//]
        bookmark.url = "http://#{bookmark.url}"
      end

      domain = URI.parse(bookmark.url).host
      site = Site.find_or_create_by_domain(domain)
      bookmark.site_id = site.id

      bookmark.title = GetPageTitle.from(bookmark.url)
      bookmark.shortening = shortener.shorten(bookmark.url)
    end

    bookmark.save
    bookmark
  end
end
