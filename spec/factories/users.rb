FactoryBot.define do
    factory :user do
        name {'テストユーザー'} 
        mail {'test@example.com'}
        password {'test'}
        point {'500'}
        logged_in {'2021-04-17 17:03:36.949067'}
        admin{'false'}
        count{0}
    end
end