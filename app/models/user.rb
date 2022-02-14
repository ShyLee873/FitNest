# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :phone, numericality: {only_integer: true}
    validates :phone, length: {is: 10}
    validates :email, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    has_many :memberships
    has_many :groups, through: :memberships, dependent: :destroy
    has_one_attached :avatar 
    has_many :posts
<<<<<<< HEAD
    has_many :likes, dependent: :destroy
=======
    has_many :comments
>>>>>>> b6b95a9b72d61c5f3b9b416492108caf268c8706

    def full_name
        "#{first_name} #{last_name}"
    end

    def author?(obj)
        obj.user == self
    end
    
end
