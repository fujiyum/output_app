require 'rails_helper'

RSpec.describe Input, type: :model do
    describe 'アソシエーションのテスト' do
        context 'Titleモデルとの関係' do
            it 'N:1となっている' do
                expect(Input.reflect_on_association(:title).macro).to eq :belongs_to
            end
        end
        context 'Commentモデルとの関係' do
            it '1:Nとなっている' do
                expect(Input.reflect_on_association(:comments).macro).to eq :has_many
            end
        end
        context 'Outputモデルとの関係' do
            it 'N:1となっている' do
                expect(Input.reflect_on_association(:outputs).macro).to eq :has_many
            end
        end
    end

    describe 'バリデーションのテスト' do
        context '空白のバリデーションチェック' do
            it 'inputカラムが空欄でないこと' do
            input = Input.new(input:'', target:'hoge')
            expect(input).to be_invalid
            expect(input.errors[:input]).to include("を入力してください")
            end

            it 'targetカラムが空欄でないこと' do
            input = Input.new(input:'hoge', target:'')
            expect(input).to be_invalid
            expect(input.errors[:target]).to include("を入力してください")
            end
        end
    end
end
