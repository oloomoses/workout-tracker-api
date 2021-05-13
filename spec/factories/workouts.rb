FactoryBot.define do
  factory :workout do
    name { Faker::Lorem.word }
    icon { Faker::Lorem.word }
    created_by { create(:user) }
  end
end
