class Order < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich

    accepts_nested_attributes_for :orders #order_attributes=

end
