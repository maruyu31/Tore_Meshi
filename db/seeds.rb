# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@mail.com", password: "password", password_confirmation: "password")

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "test#{n + 1}",
    password: "password",
    password_confirmation: "password",
    profile_image: File.open('./app/assets/images/2977.jpg')
  )
end

Category.create!(name: "ヘルシー")
Category.create!(name: "増量")
Category.create!(name: "おかず")
Category.create!(name: "おやつ")
Category.create!(name: "その他")



5.times do
  Recipe.create!({
    image: File.open('./app/assets/images/2977.jpg'),
    user_id: 1,
    category_id: 2,
    title: Faker::Food.ingredient,
    introduction: Faker::Lorem.sentences(number: 30),
    serving: "1",
    ingredients_attributes: [
      {
        name: "test",
        amount: "test",
        carbohydrate: 10,
        protein: 2,
        fat: 2,
      }
    ],
    procedures_attributes: [
      {body: "test"}
    ]
  })
end

5.times do
  Recipe.create!({
    image: File.open('./app/assets/images/2977.jpg'),
    user_id: 2,
    category_id: 1,
    title: Faker::Food.ingredient,
    introduction: Faker::Lorem.sentences(number: 30),
    serving: "1",
    ingredients_attributes: [
      {
        name: "test",
        amount: "test",
        carbohydrate: 30,
        protein: 15,
        fat: 4,
      }
    ],
    procedures_attributes: [
      {body: "test"}
    ]
  })
end

5.times do
  Recipe.create!({
    image: File.open('./app/assets/images/2977.jpg'),
    user_id: 3,
    category_id: 4,
    title: Faker::Food.ingredient,
    introduction: Faker::Lorem.sentences(number: 30),
    serving: "1",
    ingredients_attributes: [
      {
        name: "test",
        amount: "test",
        carbohydrate: 10,
        protein: 30,
        fat: 5,
      }
    ],
    procedures_attributes: [
      {body: "test"}
    ]
  })
end

5.times do
  Recipe.create!({
    image: File.open('./app/assets/images/2977.jpg'),
    user_id: 4,
    category_id: 3,
    title: Faker::Food.ingredient,
    introduction: Faker::Lorem.sentences(number: 30),
    serving: "1",
    ingredients_attributes: [
      {
        name: "こめ",
        amount: "100",
        carbohydrate: 10,
        protein: 2,
        fat: 2,
      }
    ],
    procedures_attributes: [
      {body: "握る"}
    ]
  })
end
