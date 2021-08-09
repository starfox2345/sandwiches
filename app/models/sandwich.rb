class Sandwich < ApplicationRecord
    validates :condition, presence: true
    validates :name, presence: true, length: {minimum: 2}
    validates :price, numericality: {greater_than: 0, lesser_than: 100}
    validates :temperature, presence: true


    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    def self.most_expensive
        self.order(price: :desc)
    end
end
