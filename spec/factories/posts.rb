FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    postable_type { "User" }
    postable_id { User.first.id }
  end
end
