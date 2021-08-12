class Sandwich < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders

    
    validates :condition, presence: true
    validates :recipe, presence: true, uniqueness: {scope: [:recipe]}, length: {minimum: 2, message: "needs to be longer than 2 letters"}
    validates :price, numericality: {greater_than: 0, lesser_than: 100}
    validates :temperature, presence: true, temperature_name: true
    

    # validate :too_many_sandwiches
    

    def recipe_temperature
        "#{self.recipe} - #{self.temperature}"
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
