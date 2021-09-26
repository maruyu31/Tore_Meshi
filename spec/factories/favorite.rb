FactoryBot.define do
  factory :favorite do
    association :recipe
    user { recipe.user }
  end
end
