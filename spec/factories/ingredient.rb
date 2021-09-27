FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    amount { "2" }
    protein { 10 }
    carbohydrate { 10 }
    fat { 10 }
  end
end
