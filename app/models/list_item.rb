class ListItem < ActiveRecord::Base
  
  has_paper_trail
  acts_as_list scope: :list
  
  belongs_to :list, counter_cache: :list_item_count
  has_many :attribute_items, lambda { order(position: :asc) }, as: :target
  
  validates :title, presence: true
  validates :url, url: true, allow_blank: true
  
  # @params [String] title
  # @returns [String]
  def get_attribute(title)
    item = attribute_items.where(title: title).first_or_create
    item.body
  end
  
  # @params [String] title
  # @params [String] body
  def set_attribute(title, body)
    item = attribute_items.where(title: title).first_or_create
    item.body = body
    item.save
  end
  
end
