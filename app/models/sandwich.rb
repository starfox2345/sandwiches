class Sandwich < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    belongs_to :category

    accepts_nested_attributes_for :category

    
    validates :condition, presence: true
    validates :name, presence: true, uniqueness: {scope: [:name]}, length: {minimum: 2, message: "needs to be longer than 2 letters"}
    validates :price, numericality: {greater_than: 0, lesser_than: 100}
    

    # validate :too_many_sandwiches
    

    def name_condition
        "#{self.name} - #{self.condition}"
    end

    def self.most_expensive
        self.order(price: :desc)
    end

    # def too_many_sandwiches
    #     if Sandwich.all.length >= 10
    #         errors.add(:base, :invalid, message: "You have too many sandwiches")
    #     end
    # end
end
