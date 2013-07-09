class Bookmark < ActiveRecord::Base
  attr_accessible :shortening, :site_id, :url, :tag_list, :title
  acts_as_taggable
  validates :url, presence: true
  belongs_to :site

  def self.create_with(opts)
    BookmarkFactory.create(opts)
  end

  def result_title
    "Bookmark: #{self.title}"
  end
end
