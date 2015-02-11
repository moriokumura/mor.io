class AttributeItem < ActiveRecord::Base
  
  has_paper_trail
  acts_as_list scope: :target
  
  belongs_to :target, polymorphic: true
  
  validates :target_type, presence: true
  validates :target_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
end