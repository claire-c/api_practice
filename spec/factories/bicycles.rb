# frozen_string_literal: true

FactoryBot.define do
  factory :bicycle do
    colour { Faker::Color.color_name }
    brand { Faker::Lorem.word }
    tyre_width { Faker::Number.within(range: 25..45) }
  end
end
