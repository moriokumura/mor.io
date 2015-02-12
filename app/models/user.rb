class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_paper_trail only: %w(name email slug)
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :lists
  
  validates :name, presence: true
  
end
