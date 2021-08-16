class User < ApplicationRecord
    has_many :orders
    has_many :sandwiches, through: :orders

    validates :email, presence: true, uniqueness: true
    has_secure_password
end