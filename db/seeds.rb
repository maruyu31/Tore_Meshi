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

Tag.create!(name: "ヘルシー")
Tag.create!(name: "増量")
Tag.create!(name: "おかず")
Tag.create!(name: "おやつ")



20.times do
  Recipe.create!({
    image: File.open('./app/assets/images/2977.jpg'),
    user_id: 1,
    tag_id: 2,
    title: Faker::Food.ingredient,
    introduction: Faker::Lorem.sentences(number: 30),
    serving: "1",
    carbohydrate: 10,
    protein: 2,
    fat: 2,
    ingredients_attributes: [
      {
        name: "こめ",
        amount: "100",
      }
    ],
    procedures_attributes: [
      {body: "握る"}
    ]
  })
end





