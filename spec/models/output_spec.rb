require 'rails_helper'

RSpec.describe Output, type: :model do
    describe 'アソシエーションのテスト' do
        context 'Inputモデルとの関係' do
            it '1:Nとなっている' do
                expect(Output.reflect_on_association(:input).macro).to eq :belongs_to
            end
        end
    end

    describe 'バリデーションのテスト' do
        context '空白のバリデーションチェック' do
            it 'outputカラムが空欄でないこと' do
            output = Output.new(output:'', feedback:'hoge')
            expect(output).to be_invalid
            expect(output.errors[:output]).to include("を入力してください")
            end
        end

        context '空白のバリデーションチェック' do
            it 'feedbackカラムが空欄でないこと' do
            output = Output.new(output:'hoge', feedback:'')
            expect(output).to be_invalid
            expect(output.errors[:feedback]).to include("を入力してください")
            end
        end
    end
end
