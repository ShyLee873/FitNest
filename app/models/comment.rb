class Comment < ApplicationRecord
<<<<<<< HEAD
    belongs_to :commentable, polymorphic: true
    validates :body, presence: true
=======
    belongs_to :post
    belongs_to :user
>>>>>>> b6b95a9b72d61c5f3b9b416492108caf268c8706
end
