require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Categoryモデルのテスト' do
    it '有効なカテゴリーを持つこと' do
      expect(FactoryBot.build(:category)).to be_valid
    end
    
    it 'nameがなければ無効な状態であること' do
      category = FactoryBot.build(:category, name: nil)
      category.valid?
      expect(category.errors[:name]).to include('を入力してください')
    end
  end
end
