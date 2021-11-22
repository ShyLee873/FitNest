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
    validates_associated :user_id
    validates :name, presence: true
    validates :activity_type, presence: true
    
end
