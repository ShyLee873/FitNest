FactoryBot.define do
  factory :comment do
<<<<<<< HEAD
    commentable_type { "MyString" }
    commentable_id { 1 }
    user_id { 1 }
    body { "MyText" }
=======
    content { "MyText" }
    post_id { 1 }
>>>>>>> b6b95a9b72d61c5f3b9b416492108caf268c8706
  end
end
