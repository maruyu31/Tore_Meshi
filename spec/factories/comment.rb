FactoryBot.define do
  factory :comment do
    association :user
    association :recipe
    comment { Faker::Lorem.characters(number: 20) }
  end
end
