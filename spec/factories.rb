FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    password { Faker::Lorem.word }
  end

  factory :question do
    association :user
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
  end
end