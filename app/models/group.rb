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
    validates_inclusion_of :senior, in: [true, false] 
    validates_inclusion_of :gym_required, in: [true, false] 
    has_one_attached :avatar 
end
