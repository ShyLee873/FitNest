class Group < ApplicationRecord
    has_many :memberships
    has_many :user, through: :memberships
    has_many :membership, foreign_key: "group_id"
end
