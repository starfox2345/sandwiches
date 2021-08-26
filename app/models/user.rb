class User < ApplicationRecord
    has_many :orders
    has_many :sandwiches, through: :orders

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_secure_password



end