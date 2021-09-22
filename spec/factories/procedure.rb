FactoryBot.define do
  factory :procedure do
    association :recipe
    body { Faker::Lorem.characters(number: 20) }
  end
end
