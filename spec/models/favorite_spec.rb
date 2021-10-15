require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end
  describe 'Favoriteモデルのテスト' do
    it '有効なモデルを持つこと' do
      expect(FactoryBot.create(:favorite)).to be_valid
    end
    
    it 'user_idがなければ無効な状態であること' do
      @favorite.user_id = nil
      @favorite.valid?
      expect(@favorite.errors[:user_id]).to include('を入力してください')
    end
    
    it 'recipe_idがなければ無効な状態であること' do
      @favorite.recipe_id = nil
      @favorite.valid?
      expect(@favorite.errors[:recipe_id]).to include('を入力してください')
    end
    
    it 'recipe_idが同じでもuser_idが違うと保存できること' do
      favorite = FactoryBot.create(:favorite)
      expect(FactoryBot.create(:favorite, recipe_id: favorite.recipe_id)).to be_valid
    end

    it 'user_idが同じでもrecipe_idが違うと保存できること' do
      favorite = FactoryBot.create(:favorite)
      expect(FactoryBot.create(:favorite, user_id: favorite.user_id)).to be_valid
    end
  end
end