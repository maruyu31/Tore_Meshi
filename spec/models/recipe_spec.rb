require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Recipe, type: :model do
  describe "Recipeモデルのテスト" do
    it "有効なレシピを持つこと" do
      expect(FactoryBot.build(:recipe)).to be_valid
    end
  end
end