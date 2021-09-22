FactoryBot.define do
  factory :recipe do
    association :user
    title { Faker::Food.ingredient }
    introduction { Faker::Lorem.sentences(number: 30) }
    serving { "2人分" }
    category { FactoryBot.create(:category) }
  end
end
