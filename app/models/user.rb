class User < ApplicationRecord
    has_many :orders
    has_many :sandwiches, through: :orders
    #add validations uniq for email
    has_secure_password
end