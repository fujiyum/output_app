require 'rails_helper'

describe 'タイトル機能', type: :system do
    describe '一覧表示機能' do
      before do
        user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@com', password: 'password', password_confirmation: 'password')
        FactoryBot.create(:title, title_name: '最初のタイトル', user: user_a)
      end
      
      context 'ユーザーAがログインしているとき' do
        before do
            visit new_user_session_path
            fill_in 'メールアドレス', with: 'a@com'
            fill_in 'パスワード', with: 'password'
            click_botton 'Log in'
        end
      end
    end
end