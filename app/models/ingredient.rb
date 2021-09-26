class Ingredient < ApplicationRecord
  belongs_to :recipe

  with_options presence: true do
    validates :recipe_id
    validates :name
    validates :amount
    validates :protein
    validates :carbohydrate
    validates :fat
  end
end
