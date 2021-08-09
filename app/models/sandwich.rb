class Sandwich < ApplicationRecord
    validates :condition, presence: true
    validates :name, presence: true, uniqueness: {scope: [:name]}, length: {minimum: 2, message: "Name needs to be longer than 2 letters"}
    validates :price, numericality: {greater_than: 0, lesser_than: 100}
    validates :temperature, presence: true, temperature_name: true
    validate :too_many_sandwiches
    

    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    def self.most_expensive
        self.order(price: :desc)
    end

    def too_many_sandwiches
        if Sandwich.all.length >= 10
            errors.add(:base, :invalid, message: "You have too many sandwiches")
        end
    end
end
