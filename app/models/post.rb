class Post < ApplicationRecord

  include Authorship
  belongs_to :user
<<<<<<< HEAD
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable
=======
  has_many :comments
>>>>>>> b6b95a9b72d61c5f3b9b416492108caf268c8706
  end
