require 'rails_helper'

RSpec.describe Title, type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it '1:Nとなっている' do
                expect(Title.reflect_on_association(:user).macro).to eq :belongs_to
            end
        end
        context 'Inputモデルとの関係' do
            it 'N:1となっている' do
                expect(Title.reflect_on_association(:inputs).macro).to eq :has_many
            end
        end
        context 'Noteモデルとの関係' do
            it 'N:1となっている' do
                expect(Title.reflect_on_association(:notes).macro).to eq :has_many
            end
        end
    end

    describe 'バリデーションのテスト' do
        context '空白のバリデーションチェック' do
            it 'title_nameカラムが空欄でないこと' do
            title = Title.new(title_name:'', image_id:'hoge')
            expect(title).to be_invalid
            expect(title.errors[:title_name]).to include("を入力してください")
            end
        end
    end
end
