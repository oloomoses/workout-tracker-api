FactoryBot.define do
  factory :track_it do
    date { Faker::Date.backward(days: 14) }
    description { Faker::Lorem.sentences }
    minutes_recorded { Faker::Number.number(digits: 2) }
    user_id { create(:user) }
  end
end
