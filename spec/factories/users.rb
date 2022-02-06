FactoryBot.define do
    factory :user do
        name {'テストユーザー'}
        email {'test@com'}
        password {'password'}
        password_confirmation {'password'}
    end
end