class User < ApplicationRecord
    has_many :groups
    has_many :group, through: :memberships
    has_many :membership, foreign_key: "user_id"

    def full_name
        "#{first_name} #{last_name}"
    end

end
