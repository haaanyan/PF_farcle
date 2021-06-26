FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 15) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 150) }
    prefecture { rand(1..47)}
    product { Faker::Lorem.characters(number: 5) }
    history { Faker::Number.number(digits: 1) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end