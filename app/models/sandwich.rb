class Sandwich < ApplicationRecord
    def name_temperature
        "#{self.name} - #{self.temperature}"
    end


end
