class User < ApplicationRecord
    has_many :orders
    has_many :sandwiches, through: :orders
end
