FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    password { "password" }
    password_confirmation { "password" }
  end
end