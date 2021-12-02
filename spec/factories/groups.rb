require 'faker'
FactoryBot.define do
  factory :group do
    name { Faker::Lorem.words(number: 2).to_s }
    activity_type { Faker::Lorem.word }
    senior { true }
  end
end