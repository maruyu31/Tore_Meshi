class Tag < ApplicationRecord
  has_many :recipes
  
  validates :name, presence: true
end
