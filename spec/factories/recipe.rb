FactoryBot.define do
  factory :recipe do
    association :user
    association :category
    title { Faker::Food.ingredient }
    introduction { Faker::Lorem.sentences(number: 30) }
    serving { "2人分" }

    after(:build) do |recipe|
      recipe.ingredients << FactoryBot.build(:ingredient)
      recipe.procedures << FactoryBot.build(:procedure)
    end
  end
end
