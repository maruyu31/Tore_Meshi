require 'rails_helper'

describe '管理者のテスト' do
  let(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe) }
  let!(:category) { create(:category) }
  let!(:contact) { create(:contact) }

  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
  end

  describe '管理者ログイン後のヘッダーのテスト' do
    it 'ログイン後のリダイレクト先が管理者トップページになっている' do
      expect(current_path).to eq admin_path
    end

    it '会員一覧を押すと会員一覧画面に遷移する' do
      click_link '会員一覧'
      expect(current_path).to eq admin_users_path
    end

    it 'レシピ一覧を押すとレシピ一覧画面に遷移する' do
      click_link 'レシピ一覧'
      expect(current_path).to eq admin_recipes_path
    end

    it 'カテゴリー一覧を押すとカテゴリー一覧画面に遷移する' do
      click_link 'カテゴリー一覧'
      expect(current_path).to eq admin_categories_path
    end

    it 'お問い合わせ一覧を押すとお問い合わせ一覧画面に遷移する' do
      click_link 'お問い合わせ一覧'
      expect(current_path).to eq admin_contacts_path
    end

    it 'ログアウトを押すと管理者ログイン画面に遷移する' do
      click_link 'ログアウト'
      expect(current_path).to eq new_admin_session_path
    end
  end

  describe '管理者側の会員一覧のテスト' do
    before do
      visit admin_users_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admin/users'
      end

      it '会員IDが表示される' do
        expect(page).to have_content '会員ID'
      end

      it '会員編集画面へのリンクが存在する' do
        expect(page).to have_link '', href: admin_user_path(user)
      end
    end

    context '会員編集リンクのテスト' do
      it '編集画面に遷移する' do
        click_link user.name
        expect(current_path).to eq '/admin/users/' + user.id.to_s
      end
    end

    context '会員編集画面のテスト' do
      before do
        visit admin_user_path(user)
      end

      it '会員ステータスが存在する' do
        expect(page).to have_content '会員ステータス'
      end

      it '有効にチェックボックスがチェックされている' do
        expect(page).to have_checked_field('user_is_deleted_false')
      end
    end

    context '会員編集のテスト' do
      before do
        visit admin_user_path(user)
        choose 'user_is_deleted_true'
        click_button '変更'
      end

      it '画面の遷移先が正しい' do
        expect(current_path).to eq '/admin/users/' + user.id.to_s
      end

      it '会員のステータスが変更に変わっている' do
        visit admin_users_path
        expect(page).to have_content '退会'
      end
    end
  end

  describe '管理者側のレシピ一覧のテスト' do
    before do
      visit admin_recipes_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admin/recipes'
      end

      it 'レシピIDが表示される' do
        expect(page).to have_content 'レシピID'
      end

      it 'レシピ編集画面へのリンクが存在する' do
        expect(page).to have_link '', href: admin_recipe_path(recipe)
      end
    end

    context 'レシピ編集リンクのテスト' do
      it '編集画面に遷移する' do
        click_link recipe.title
        expect(current_path).to eq '/admin/recipes/' + recipe.id.to_s
      end
    end

    context 'レシピ編集画面のテスト' do
      before do
        visit admin_recipe_path(recipe)
      end

      it 'レシピ説明が表示される' do
        expect(page).to have_content recipe.introduction
      end

      it '削除ボタンが表示されている' do
        expect(page).to have_link '削除する'
      end
    end

    context 'レシピ削除のテスト' do
      before do
        visit admin_recipe_path(recipe)
        click_link '削除する'
      end

      it '画面の遷移先が正しい' do
        expect(current_path).to eq '/admin/recipes'
      end

      it 'レシピが削除されている' do
        expect(page).to have_no_content recipe.title
      end
    end
  end

  describe '管理者側のカテゴリー一覧のテスト' do
    before do
      visit admin_categories_path
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admin/categories'
      end

      it 'カテゴリー一覧が表示される' do
        expect(page).to have_content 'カテゴリー　一覧・追加'
      end

      it 'カテゴリー編集画面へのリンクが存在する' do
        expect(page).to have_link '', href: edit_admin_category_path(category)
      end
    end
    
    context 'カテゴリー追加のテスト' do
      before do
        fill_in 'category_name', with: 'test'
        click_button '新規登録'
      end

      it '遷移先が正しい' do
        expect(current_path).to eq '/admin/categories'
      end
      
      it 'カテゴリーが追加される' do
        expect(page).to have_content 'test'
      end
    end
    
    context 'カテゴリー編集画面のテスト' do
      before do
        visit edit_admin_category_path(category)
      end
      
      it 'ジャンル編集が表示される' do
        expect(page).to have_content 'ジャンル編集'
      end

      it '削除ボタンが表示されている' do
        expect(page).to have_button '変更を保存'
      end
    end
    
    context 'カテゴリー編集のテスト' do
      before do
        visit edit_admin_category_path(category)
        fill_in 'category_name', with: 'test2'
        click_button '変更を保存'
      end

      it '画面の遷移先が正しい' do
        expect(current_path).to eq '/admin/categories/' + category.id.to_s + '/edit'
      end

      it 'カテゴリーの変更が適用されている' do
        visit admin_categories_path
        expect(page).to have_content 'test2'
      end
    end
  end

  describe '管理者側の問い合わせ一覧のテスト' do
    before do
      visit admin_contacts_path
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admin/contacts'
      end

      it '問い合わせ番号が表示される' do
        expect(page).to have_content '問い合わせ番号'
      end

      it 'お問い合わせ確認画面へのリンクが存在する' do
        expect(page).to have_link '', href: admin_contact_path(contact)
      end
    end
    
    context 'お問い合わせ編集画面のテスト' do
      before do
        visit admin_contact_path(contact)
      end
      
      it '問い合わせ内容が表示されている' do
        expect(page).to have_content contact.body
      end
      
      it '問い合わせステータスが未対応の状態である' do
        expect(page).to have_select('contact_status', selected: '未対応')
      end
    end
    
    context '問い合わせ編集のテスト' do
      before do
        visit admin_contact_path(contact)
        select '対応中', from: 'contact_status'
        click_button '変更'
      end
      
      it '画面の遷移先が正しい' do
        expect(current_path).to eq '/admin/contacts/' + contact.id.to_s
      end

      it '問い合わせのステータスが対応中に変わっている' do
        visit admin_contacts_path
        expect(page).to have_content '対応中'
      end
    end
  end
end
