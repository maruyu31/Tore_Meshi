require 'rails_helper'

describe "ユーザーログイン前のテスト" do
  describe "トップ画面のテスト" do
    before do
      visit root_path
    end

    it "ヘッダーに新規登録のリンクが存在する" do
      expect(page).to have_link "新規登録"
    end

    it "ヘッダーにログインのリンクが存在する" do
      expect(page).to have_link "ログイン"
    end
  end

  describe "ユーザー新規会員登録のテスト" do
    before do
      visit new_user_registration_path
    end

    context "新規会員登録情報が全て入力される場合" do
      before do
        fill_in "user[name]", with: Faker::Name.name
        fill_in "user[email]", with: Faker::Internet.email
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
      end

      it "新規登録に成功する" do
        expect { click_button '新規登録' }.to change(User.all, :count).by(1)
      end

      it "新規登録後のリダイレクト先が登録したユーザーの詳細画面になっている" do
        click_button "新規登録"
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end

    context "新規会員登録情報が入力されない場合" do
      before do
        fill_in "user[name]", with: ""
        fill_in "user[email]", with: ""
        fill_in "user[password]", with: ""
        fill_in "user[password_confirmation]", with: ""
      end

      it "新規登録に失敗する" do
        expect { click_button "新規登録" }.to change(User.all, :count).by(0)
      end
    end
  end

  describe "ユーザーログインのテスト" do
    let!(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context "ログインが成功した場合" do
      before do
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_button 'ログイン'
      end

      it "ログイン後のリダイレクト先がユーザーの詳細画面になっている" do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context "ログインに失敗した場合" do
      before do
        fill_in "user[email]", with: ""
        fill_in "user[password]", with: ""
        click_button "ログイン"
      end

      it "ログインに失敗し、ログイン画面にリダイレクトされる" do
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end

  describe "ユーザーログアウトのテスト" do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "ログイン"
    end
    
    it "ログアウト後のリダイレクト先がログインページになっている" do
      click_link "ログアウト"
      expect(current_path).to eq "/users/sign_in"
    end
  end
end