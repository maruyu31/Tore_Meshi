FactoryBot.define do
  factory :contact do
    title { Faker::Lorem.characters(number: 20) }
    body { Faker::Lorem.characters(number: 20) }
    status { 0 }
  end
end
