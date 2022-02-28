class Event < ApplicationRecord
  belongs_to :group
  validates :date, :title, :body, presence: true

  scope :past_events, -> {where("date < ?", Date.today) }
  scope :upcoming_events, -> {where("date > ?", Date.today) }
  scope :today_events, -> { where(date: Date.today) }
end
