class Post < ApplicationRecord

  include Authorship
  belongs_to :postable, polymorphic: true
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, as: :commentable
  end
