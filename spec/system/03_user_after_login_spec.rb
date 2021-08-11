# require 'rails_helper'

# describe "ログイン後のテスト" do
#   let(:user) { create(:user) }

#   before do
#     visit new_user_session_path
#     fill_in 'admin[email]', with: admin.email
#     fill_in 'admin[password]', with: admin.password
#     click_button 'ログイン'
#   end
  
#   describe "ログアウトのテスト" do
#     it "ログイン後のリダイレクト先が管理者トップページになっている" do
#       expect(current_path).to eq admin_contacts_path
#     end
    
#     it "ヘッダーにログアウトのリンクが存在する" do
#       expect(page).to have_link "ログアウト"
#     end
    
#     it "ログアウトのリンクを押すと管理者ログイン画面に遷移する" do
#       click_link "ログアウト"
#       expect(current_path).to eq new_admin_session_path
#     end
#   end
# end