FactoryBot.define do
  factory :post_image do
    association :user
    caption { Faker::Lorem.paragraph }
    image { File.open(Rails.root.join('seed_image/seed_image (0).jpeg')) }
  end
end