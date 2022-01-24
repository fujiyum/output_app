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
        subject { input.valid? }

        let!(:input) { create(:input) }

        context 'inputカラム' do
            it '空欄でないこと' do
            input.input = ''
            is_expected.to eq false
            end
        end
    end
end
