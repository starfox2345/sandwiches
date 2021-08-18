class Order < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich


    validates :delivery, presence: true

    accepts_nested_attributes_for :sandwich
end
