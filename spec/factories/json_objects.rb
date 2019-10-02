# frozen_string_literal: true

FactoryBot.define do
  factory :json_object do
    json_string { Faker::Json.shallow_json(width: 3, options: { key: 'Lorem.word', value: 'Lorem.word' }) }
  end
end
