class Post < ApplicationRecord

  include Authorship
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, as: :commentable
  end
