class RecipeForm
  include ActiveModel::Model

  attr_accessor :user_id, :category_id, :title, :introduction, :serving, :body, :name, :amount, :protein, :carbohydrate, :fat

  with_options presence: true do
    # レシピモデルのバリデーション
    validates :user_id
    validates :category_id
    validates :title
    validates :introduction
    validates :serving
    # 手順モデルのバリデーション
    validates :body
    # 材料モデルのバリデーション
    validates :name
    validates :amount
    validates :protein
    validates :carbohydrate
    validates :fat
  end

  def save
    recipe = Recipe.create(user_id: user_id, category_id: category_id,　image: image, title: title, introduction: introduction, serving: serving)
    Procedure.build(body: body, recipe_id: recipe_id)
    Ingredient.build(name: name, amount: amount, protein: protein, carbohydrate: carbohydrate, fat: fat)
  end
end