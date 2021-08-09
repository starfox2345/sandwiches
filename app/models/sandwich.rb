class Sandwich < ApplicationRecord
    validates :price, presence: true


    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    def self.most_expensive
        self.order(price: :desc)
    end
end
