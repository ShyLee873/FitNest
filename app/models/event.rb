class Event < ApplicationRecord
  belongs_to :group
  has_many :users
  validates :date, :title, :body, :longitude, :latitude, presence: true
end
