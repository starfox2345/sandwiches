class Sandwich < ApplicationRecord
    def name_temperature_condition_price
        "#{self.name} - #{self.temperature} - #{self.condition} - $#{self.price}"
    end
end
