FactoryBot.define do
  factory :event do
    title { "MyString" }
    body { "MyText" }
    date { "2022-01-31 21:42:35" }
    longitude { 1.5 }
    latitude { 1.5 }
  end
end
