FactoryBot.define do
  factory :user_question do
    name { "" }
    problem { "MyText" }
    answer { "MyText" }
    mistake1 { "MyText" }
    mistake2 { "MyText" }
    mistake3 { "MyText" }
    user_id { 1 }
  end
end
