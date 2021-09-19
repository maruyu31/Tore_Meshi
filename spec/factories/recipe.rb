FactoryBot.define do
  factory :recipe do
    association :ingredient
    association :procedure
    association :user
    association :category
    title { "admin@email.com" }
    introduction { "password" }
    serving { "password" }
  end
end
