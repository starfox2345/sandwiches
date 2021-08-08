class Sandwich < ApplicationRecord
    def name_temperature
        "#{self.name} - #{self.temperature}"
    end

    # def self.order_by_price
    #     self.order(:price)
    # end

    # def self.most_expensive
    #     self.where("price > 4")
    # end

    def self.most_expensive
        self.order(price: :desc)
    end
end
