class Recipe < ApplicationRecord
  # Floatによる誤差をなくすためにBigDecimalを使用
  require 'bigdecimal'
  # to_d メソッドが使えるようになる
  require 'bigdecimal/util'

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :procedures, :ingredients, allow_destroy: true # 子項目削除のため
  belongs_to :category
  attachment :image

  with_options presence: true do
    validates :title
    validates :introduction
    validates :serving
  end

  # カロリー計算のためのメソッド

  def protein_calory
    self.ingredients.all.sum(:protein).to_d * 4
  end

  def carbo_calory
    self.ingredients.all.sum(:carbohydrate).to_d * 4
  end

  def fat_calory
    self.ingredients.all.sum(:fat).to_d * 9
  end

  def total_calory
    protein_calory + carbo_calory + fat_calory
  end

  def protein_rate
    (protein_calory / total_calory * 100).round
  end

  def carbo_rate
    (carbo_calory / total_calory * 100).round
  end

  def fat_rate
    (fat_calory / total_calory * 100).round
  end

  # ユーザーがレシピをお気に入り登録しているかを判断するメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Recipe.where(['title LIKE ?', "%#{search}%"])
    else
      Recipe.all
    end
  end
end
