class Site < ActiveRecord::Base
  attr_accessible :domain
  validate :domain, presence: true
  has_many :bookmarks

  def result_title
    "Site: #{self.domain}"
  end
end
