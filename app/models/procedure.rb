class Procedure < ApplicationRecord
  belongs_to :recipe

  validates :recipe_id, presence: true
  validates :body, presence: true
end
