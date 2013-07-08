class Bookmark < ActiveRecord::Base
  attr_accessible :shortening, :site_id, :url, :tag_list
  acts_as_taggable
end
