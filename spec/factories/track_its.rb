FactoryBot.define do
  factory :track_it do
    calories { Faker::Number.number(digits: 2) }
    minutes_recorded { Faker::Number.number(digits: 2) }
    user_id { create(:user) }
  end
end
