class ListItem < ActiveRecord::Base
  
  has_paper_trail
  acts_as_list scope: :list
  
  belongs_to :list, counter_cache: :list_item_count
  
  validates :title, presence: true
  validates :url, url: true, allow_blank: true
  
end
