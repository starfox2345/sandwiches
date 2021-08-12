class Order < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich

    accepts_nested_attributes_for :sandwich #sandwich_attributes=
    accepts_nested_attributes_for :user
end
