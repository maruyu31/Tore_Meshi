require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Commentモデルのテスト' do
    it '有効なコメントを持つこと' do
      expect(FactoryBot.create(:comment)).to be_valid
    end
    
    it 'commentがなければ無効な状態であること' do
      comment = FactoryBot.build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include('を入力してください')
    end
    
    it 'user_idがなければ無効な状態であること' do
      comment = FactoryBot.build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include('を入力してください')
    end
    
    it 'recipe_idがなければ無効な状態であること' do
      comment = FactoryBot.build(:comment, recipe_id: nil)
      comment.valid?
      expect(comment.errors[:recipe_id]).to include('を入力してください')
    end
  end
end
