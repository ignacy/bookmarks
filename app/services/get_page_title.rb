module GetPageTitle
  def self.from(url)
    return "#{url}/TITLE" if Rails.env.test?
    Mechanize.new.get(url).title
  end
end
