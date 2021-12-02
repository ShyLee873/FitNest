require 'faker'
FactoryBot.define do
  factory :group do
    name { Faker::Lorem.words(number: 2) }
    activity_type { Faker::Lorem.word }
    senior { true }
  end
end