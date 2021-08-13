class Order < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich
    #add validations
    accepts_nested_attributes_for :sandwich #sandwich_attributes=
end
