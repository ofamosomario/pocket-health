# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..15) }
    email    { Faker::Internet.email }
    password { '123123' }
    password_confirmation { '123123' }
  end
end
