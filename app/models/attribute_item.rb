class AttributeItem < ActiveRecord::Base
  
  has_paper_trail
  acts_as_list scope: :target
  
  belongs_to :target, polymorphic: true
  
  validates :key, presence: true
  validates :title, presence: true
  validates :body, presence: true
end