FactoryBot.define do
  factory :workout do
    name { Faker::Lorem.word }
    icon { Faker::Lorem.word }
  end
end
