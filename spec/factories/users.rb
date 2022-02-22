require 'faker'
FactoryBot.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.about_me { "Some text about me" }
    f.group_id { 1 }
    f.phone { Faker::Number.number(digits: 10) }
    f.email { Faker::Internet.email }
    f.password {"password"}
    f.role {2}
    # f.group {Group.first}
  end 
end