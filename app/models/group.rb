# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string
#  activity_type :string
#  senior        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
#Schema information added by annotate gem

class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    validates :name, presence: true
    validates :activity_type, presence: true
    validates :senior, presence: true
    #validates_associated :user_id, through: :memberships
end
