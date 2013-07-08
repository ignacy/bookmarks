class Bookmark < ActiveRecord::Base
  attr_accessible :shortening, :site_id, :url, :tag_list
  acts_as_taggable

  validates :url, presence: true

  belongs_to :site

  after_save :assign_site

  private

  def assign_site
    domain = URI.parse(url).host
    site = Site.where(domain: domain).first ||
      Site.create(domain: domain)
    self.update_column(:site_id, site.id)
  end
end
