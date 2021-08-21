# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "管理者のテスト" do

    it "メールアドレス、パスワードがあれば有効な状態であること" do
      expect(FactoryBot.build(:admin)).to be_valid
    end

    it "メールアドレスがなければ無効な状態であること" do
      admin = FactoryBot.build(:admin, email: nil)
      admin.valid?
      expect(admin.errors[:email]).to include("を入力してください")
    end
  end
end

