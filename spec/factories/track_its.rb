FactoryBot.define do
  factory :track_it do
    date { Faker::Date.backward(days: 14) }
    description { Faker::Lorem.sentenses }
    minutes_recorded { Faker::Number.number }
  end
end