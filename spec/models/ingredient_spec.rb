require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before do
    @ingredient = FactoryBot.build(:ingredient)
  end
  
  describe "Ingredientモデルのテスト" do
    it "有効なモデルを持つこと" do
      expect(FactoryBot.create(:ingredient)).to be_valid
    end
    
    it "recipe_idがなければ無効な状態であること" do
      @ingredient.recipe_id = nil
      @ingredient.valid?
      expect(@ingredient.errors[:recipe_id]).to include("を入力してください")
    end
    
    it "nameがなければ無効な状態であること" do
      @ingredient.name = nil
      @ingredient.valid?
      expect(@ingredient.errors[:name]).to include("を入力してください")
    end
    
    it "amountがなければ無効な状態であること" do
      @ingredient.amount = nil
      @ingredient.valid?
      expect(@ingredient.errors[:amount]).to include("を入力してください")
    end
    
    it "proteinがなければ無効な状態であること" do
      @ingredient.protein = nil
      @ingredient.valid?
      expect(@ingredient.errors[:protein]).to include("を入力してください")
    end
    
    it "carbohydrateがなければ無効な状態であること" do
      @ingredient.carbohydrate = nil
      @ingredient.valid?
      expect(@ingredient.errors[:carbohydrate]).to include("を入力してください")
    end
    
    it "fatがなければ無効な状態であること" do
      @ingredient.fat = nil
      @ingredient.valid?
      expect(@ingredient.errors[:fat]).to include("を入力してください")
    end
  end
end