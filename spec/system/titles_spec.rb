require 'rails_helper'

describe 'タイトル機能', type: :system do
    describe '一覧表示機能' do
      before do
        user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@ex.com', password: 'password_A', password_confirmation: 'password_A')
        FactoryBot.create(:title, title_name: '最初のタイトル', user: user_a)
      end

      context 'ユーザーAがログインしているとき' do
        before do
            visit new_user_session_path
            fill_in 'user[email]', with: 'a@ex.com'
            fill_in 'user[password]', with: 'password_A'

            click_button 'Log in'
        end

        it 'ユーザーが作成したタイトルが表示される' do
            expect(page).to have_content '最初のタイトル'
        end
      end

      context 'ユーザーBがログインしているとき' do
        before do
          FactoryBot.create(:user, name: 'ユーザーB', email: 'b@ex.com', password: 'password_B', password_confirmation: 'password_B')
          visit new_user_session_path
          fill_in 'user[email]', with: 'b@ex.com'
          fill_in 'user[password]', with: 'password_B'

          click_button 'Log in'
        end

        it 'ユーザーAが作成したタイトルが表示されない' do
          expect(page).to have_no_content '最初のタイトル'
        end
      end

    end
end