require 'rails_helper'

describe "ログイン後のテスト" do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  
  describe "ヘッダーのテスト" do
    
  end

  describe "ユーザーのテスト" do
    before do
      visit user_path(user)
    end

    it "URLが正しい" do
      expect(current_path).to eq "/users/" + user.id.to_s
    end

    # it "" do

    # end

    # it "" do

    # end

    # it "" do

    # end
  end
  
  describe "レシピ一覧のテスト" do
    
  end
  
  describe "レシピ投稿のテスト" do
    
  end
end