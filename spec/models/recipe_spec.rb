require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "Recipeモデルのテスト" do
    before do
      @recipe = FactoryBot.build(:recipe)  
    end
    
    it "有効なレシピを持つこと" do
      expect(FactoryBot.create(:recipe)).to be_valid
    end
    
    it "user_idがなければ無効な状態であること" do
      @recipe.user_id = nil
      @recipe.valid?
      expect(@recipe.errors[:user_id]).to include("を入力してください")
    end
    
    it "category_idがなければ無効な状態であること" do
      @recipe.category_id = nil
      @recipe.valid?
      expect(@recipe.errors[:category_id]).to include("を入力してください")
    end
    
    it "titleがなければ無効な状態であること" do
      @recipe.title = nil
      @recipe.valid?
      expect(@recipe.errors[:title]).to include("を入力してください")
    end
    
    it "servingがなければ無効な状態であること" do
      @recipe.serving = nil
      @recipe.valid?
      expect(@recipe.errors[:serving]).to include("を入力してください")
    end
  end
end