class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :procedures, :ingredients, allow_destroy: true #子項目削除のため
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

  def protein_calory
    self.protein * 4
  end

  def carbo_calory
    self.carbohydrate * 4
  end

  def fat_calory
    self.fat * 9
  end

  def total_calory
    protein_calory + carbo_calory + fat_calory
  end

  #ユーザーがレシピをお気に入り登録しているかを判断するメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end








end
