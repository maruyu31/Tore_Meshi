require 'rails_helper'

describe "管理者のテスト" do
  let(:admin) { create(:admin) }

  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
  end

  describe "管理者ログイン後のテスト" do
    it "ログイン後のリダイレクト先が管理者トップページになっている" do
      expect(current_path).to eq admin_path
    end

    it "ヘッダーにログアウトのリンクが存在する" do
      expect(page).to have_link "ログアウト"
    end

    it "ログアウトのリンクを押すと管理者ログイン画面に遷移する" do
      click_link "ログアウト"
      expect(current_path).to eq new_admin_session_path
    end
  end
  
  describe "管理者側のユーザー一覧のテスト" do
    
  end
  
  describe "管理者側のレシピ一覧のテスト" do
    
  end
  
  describe "管理者側の問い合わせ一覧のテスト" do
    
  end
end