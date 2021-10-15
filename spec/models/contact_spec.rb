require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Contactモデルのテスト' do
    it '有効なコンタクトを持つこと' do
      expect(FactoryBot.build(:contact)).to be_valid
    end
    
    it 'titleがなければ無効な状態であること' do
      contact = FactoryBot.build(:contact, title: nil)
      contact.valid?
      expect(contact.errors[:title]).to include('を入力してください')
    end
    
    it 'bodyがなければ無効な状態であること' do
      contact = FactoryBot.build(:contact, body: nil)
      contact.valid?
      expect(contact.errors[:body]).to include('を入力してください')
    end
  end
end