require 'rails_helper'

describe 'タイトル機能', type: :system do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@ex.com', password: 'password_A', password_confirmation: 'password_A') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@ex.com', password: 'password_B', password_confirmation: 'password_B') }
    let!(:title_a) { FactoryBot.create(:title, title_name: '最初のタイトル', user: user_a) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: login_user.email
      fill_in 'user[password]', with: login_user.password
      click_button 'Log in'
    end

    describe '一覧表示機能' do
      context 'ユーザーAがログインしているとき' do
        let(:login_user) {user_a}

        it 'ユーザーが作成したタイトルが表示される' do
            expect(page).to have_content '最初のタイトル'
        end
      end

      context 'ユーザーBがログインしているとき' do
        let(:login_user) {user_b}

        it 'ユーザーAが作成したタイトルが表示されない' do
          expect(page).to have_no_content '最初のタイトル'
        end
      end
    end

    describe '詳細表示機能' do
      context 'ユーザーAがログインしているとき' do
        let(:login_user) {user_a}

        before do
          visit title_path(title_a)
        end

        it 'ユーザーAが作成したタイトルが表示される' do
          expect(page).to have_content '最初のタイトル'
        end
      end
    end

end
