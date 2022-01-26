require 'rails_helper'

RSpec.describe Note, type: :model do
    describe 'アソシエーションのテスト' do
        context 'Titleモデルとの関係' do
            it '1:Nとなっている' do
                expect(Note.reflect_on_association(:title).macro).to eq :belongs_to
            end
        end
    end

    describe 'バリデーションのテスト' do
        context '空白のバリデーションチェック' do
            it 'noteカラムが空欄でないこと' do
            note = Note.new(note:'')
            expect(note).to be_invalid
            expect(note.errors[:note]).to include("を入力してください")
            end
        end
    end
end
