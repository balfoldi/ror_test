FactoryBot.define do
  factory :post do
    description { Faker::Lorem.characters(number: 10) }
    user
  end
end
