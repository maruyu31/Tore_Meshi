FactoryBot.define do
  factory :ingredient do
    association :recipe
    name { Faker::Food.ingredient }
    amount { "2" }
    protein { 10 }
    carbohydrate { 10 }
    fat { 10 }
  end
end
