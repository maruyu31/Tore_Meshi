FactoryBot.define do
  factory :procedure do
    body { Faker::Lorem.characters(number: 20) }
  end
end
