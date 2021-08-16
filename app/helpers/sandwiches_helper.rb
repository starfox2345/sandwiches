module SandwichesHelper
    def sandwich_price
        if @sandwich.price < 3
            content_tag(:h6, "Price: #{number_to_currency(@sandwich.price)}")
        else
            content_tag(:h2, "Price: #{number_to_currency(@sandwich.price)}")
        end
    end
end