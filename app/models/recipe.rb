class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipe_tags, foreign_key: "tag_id",	dependent: :destroy
  has_many :tags, through: :recipe_tags

  with_options presence: true do
    validates :title
    validates :introduction
    validates :serving
    validates :protein
    validates :carbohydrate
    validates :fat
  end

  attachment :image
end
