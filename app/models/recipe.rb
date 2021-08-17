class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :procedures, :ingredients, reject_if: :all_blank, allow_destroy: true #子項目削除のため
  belongs_to :tag
  attachment :image

  with_options presence: true do
    validates :title
    validates :introduction
    validates :serving
    validates :protein
    validates :carbohydrate
    validates :fat
  end
end
