require 'rails_helper'

describe 'タイトル機能', type: :system do
    describe '一覧表示機能' do
      before do
        user_a = FactoryBot.create(:user)
        FactoryBot.create(:title, title_name: '最初のタイトル', user: user_a)
      end

      context 'ユーザーがログインしているとき' do
        before do
            visit new_user_session_path
            fill_in 'user[email]', with: 'test@com'
            fill_in 'user[password]', with: 'password'
            click_button 'Log in'
        end

        it 'ユーザーが作成したタイトルが表示される' do
            expect(page).to have_content '最初のタイトル'
        end
      end
    end
end