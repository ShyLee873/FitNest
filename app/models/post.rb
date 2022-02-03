class Post < ApplicationRecord

  include Authorship
  belongs_to :user
  has_many :comments
  end
