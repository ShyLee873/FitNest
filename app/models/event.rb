class Event < ApplicationRecord
  belongs_to :group
  validates :date, :title, :body, presence: true
end
