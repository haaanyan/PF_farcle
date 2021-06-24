# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = :ja

User.create!(
  name: "テストアカウント",
  introduction: "宜しくお願いします",
  email: "test_user1@test.com",
  password: "password",
  profile_image: File.open("#{Rails.root}/user_image/profile_image.jpeg"),
  prefecture: 2,
  product: "トマト",
  history: "5"
)

10.times do |n|
  User.create!(
    name: Faker::Name.name ,
    introduction: "よろしくお願いします!",
    email: Faker::Internet.email,
    password: "testtest",
    profile_image: File.open("#{Rails.root}/user_image/user_image#{n}.jpeg"),
    prefecture: rand(1..47),
    product: "米",
    history:Faker::Number.number(digits: 1)
  )
end

if Rails.env.production?
  RAND_FUNC = 'RAND()'
else
  RAND_FUNC = 'RANDOM()'
end

10.times do |n|
  PostImage.create!(
  caption: Faker::Lorem.unique.paragraph ,
  user_id: User.find(n+1).id,
  image: File.open("#{Rails.root}/seed_image/seed_image(#{n}).jpeg")
  )
end

favorites_list = []
User.all.ids.sort.each do |user_id|
  PostImage.all.each do |post_image|
    if post_image.user_id != user_id && rand(3) == 0
      favorites_list << { user_id: user_id, post_image_id: post_image.id }
    end
  end
end
Favorite.create!(favorites_list)



10.times do |n|
  Board.create!(
  title: Faker::Lorem.unique.paragraph,
  body: Faker::Lorem.unique.paragraph,
  user_id: User.find(n+1).id
  )
end

User.all.each do |user|
  follow_users = User.order(RAND_FUNC).limit(rand(1..10))
  follow_users.each do |follow_user|
    user.follow(follow_user)
  end
end

