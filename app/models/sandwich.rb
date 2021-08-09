class Sandwich < ApplicationRecord
    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    def self.most_expensive
        self.order(price: :desc)
    end
end
