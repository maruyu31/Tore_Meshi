class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment, presence: true
  validates :recipe_id, presence: true
  validates :user_id, presence: true
end
