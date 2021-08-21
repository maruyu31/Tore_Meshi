require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーモデルのテスト" do
    it "有効なユーザーを持つこと" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "名がなければ無効な状態であること" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがなければ無効な状態であること" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")

    end

    it "重複したメールアドレスなら無効な無効な状態であること" do
      FactoryBot.create(:user, email: "test1@mail.com")
      user = FactoryBot.build(:user, email: "test1@mail.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end
end
