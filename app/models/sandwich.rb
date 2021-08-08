class Sandwich < ApplicationRecord
    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    def self.order_by_price
        self.order(:price)
    end
end
