class ListItem < ActiveRecord::Base
  
  has_paper_trail
  acts_as_list scope: :list
  
  belongs_to :list, counter_cache: :list_item_count
  has_many :attribute_items, lambda { order(position: :asc) }, as: :target
  
  validates :title, presence: true
  validates :url, url: true, allow_blank: true
  
end
