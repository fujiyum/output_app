require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'アソシエーションのテスト' do
        context 'Titleモデルとの関係' do
            it '1:Nとなっている' do
                expect(User.reflect_on_association(:titles).macro).to eq :has_many
            end
        end
        context 'Niceモデルとの関係' do
            it '1:Nとなっている' do
                expect(User.reflect_on_association(:nices).macro).to eq :has_many
            end
        end
        context 'Commentモデルとの関係' do
            it '1:Nとなっている' do
                expect(User.reflect_on_association(:comments).macro).to eq :has_many
            end
        end
    end

    describe 'バリデーションのテスト' do
        context '空白のバリデーションチェック' do
            it 'nameカラムが空欄でないこと' do
            user = User.new(name:'', email:'hoge', encrypted_password:"hoge")
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("を入力してください")
            end

            it 'emailカラムが空欄でないこと' do
            user = User.new(name:'noge', email:'', encrypted_password:"hoge")
            expect(user).to be_invalid
            expect(user.errors[:email]).to include("を入力してください")
            end
        end
    end
end
