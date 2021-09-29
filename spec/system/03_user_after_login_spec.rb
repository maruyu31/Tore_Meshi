require 'rails_helper'

describe "ログイン後のテスト" do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }
  let!(:other_recipe) { create(:recipe, user: other_user) }
  let!(:category) { create(:category) }


  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe "ログイン後のヘッダーのテスト" do
    it "ログイン後のリダイレクト先がトップページになっている" do
      expect(current_path).to eq user_path(user)
    end

    it "マイページを押すとマイページ画面に遷移する" do
      click_link "マイページ"
      expect(current_path).to eq user_path(user)
    end

    it "レシピ一覧を押すとレシピ一覧画面に遷移する" do
      click_link "レシピ一覧"
      expect(current_path).to eq recipes_path
    end

    it "レシピ投稿を押すとレシピ投稿画面に遷移する" do
      click_link "レシピ投稿"
      expect(current_path).to eq new_recipe_path
    end
  end

  describe "ユーザー画面のテスト" do
    before do
      visit user_path(user)
    end

    it "URLが正しい" do
      expect(current_path).to eq "/users/" + user.id.to_s
    end

    it "編集画面へのリンクが存在する" do
      expect(page).to have_link "", href: edit_user_path(user)
    end
  end

  describe "レシピ一覧のテスト" do
    before do
      visit recipes_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/recipes'
      end
      it '自分の投稿と他人の投稿のタイトルのリンク先がそれぞれ正しい' do
        expect(page).to have_link recipe.title, href: recipe_path(recipe)
        expect(page).to have_link other_recipe.title, href: recipe_path(other_recipe)
      end
    end
  end

  describe "レシピ詳細のテスト" do
    before do
      visit recipe_path(recipe)
    end

    context "表示内容の確認" do
      it "レシピ名が表示されている" do
        expect(page).to have_content recipe.title
      end

      it "表示されたカロリーが正しい" do
        expect(page).to have_content "170.0kcal"
      end

      it "コメント入力欄が存在する" do
        expect(page).to have_button "送信"
      end
    end
  end

  describe "レシピ投稿のテスト" do
    before do
      visit new_recipe_path
    end

    context "投稿が成功する場合" do
      before do
        fill_in "recipe[title]", with: "title"
        select '減量', from: 'recipe_category_id', match: :first
        fill_in "recipe[introduction]", with: "introduction"
        fill_in "recipe[serving]", with: "1"
        fill_in "recipe[ingredients_attributes][0][name]", with: "ing_name"
        fill_in "recipe[ingredients_attributes][0][amount]", with: "amount"
        fill_in "recipe[ingredients_attributes][0][carbohydrate]", with: 1.5
        fill_in "recipe[ingredients_attributes][0][protein]", with: 2.2
        fill_in "recipe[ingredients_attributes][0][fat]", with: 2
        fill_in "recipe[procedures_attributes][0][body]", with: "pro_body"
      end

      it '自分の新しい投稿が正しく保存される' do
        expect { click_button '新規登録' }.to change(user.recipes, :count).by(1)
      end

      it "リダイレクト先が、保存できたレシピの詳細画面になっている" do
        click_button '新規登録'
        expect(current_path).to eq '/recipes/' + Recipe.last.id.to_s
      end

      it "レシピ詳細画面のカロリーの表記が正しい" do
        click_button '新規登録'
        expect(page).to have_content "32.8kcal"
      end
    end
  end

  describe "検索機能のテスト" do
    context "レシピを検索した時の表示確認" do
      before do
        fill_in "search", with: recipe.title
        click_on "search"
      end

      it "検索したワードが表示される" do
        expect(page).to have_content recipe.title
      end
      it "投稿の画像のリンク先が正しい" do
        expect(page).to have_link "", href: recipe_path(recipe)
      end
      it "投稿の題名が表示される" do
        expect(page).to have_content recipe.title
      end
    end
  end
end