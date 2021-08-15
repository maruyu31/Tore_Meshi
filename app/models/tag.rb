class Tag < ApplicationRecord
  has_many :recipe_tags, foreign_key: "recipe_id",	dependent: :destroy
  has_many :recipes, through: :recipe_tags
  
  validates :name, presence: true
end
