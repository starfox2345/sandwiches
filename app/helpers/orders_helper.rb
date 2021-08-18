module OrdersHelper

    def index_header_sandwich
        if @sandwich
            content_tag(:h1, "#{@sandwich.ingredient} delivery:")
        else
            content_tag(:h1, "Sandwich Orders")
        end

    end

    def form_header_sandwich
        if @sandwich
            content_tag(:h1, "Create #{@sandwich.ingredient} delivery: ")
        else
            content_tag(:h1, "Create Order: ")
        end
    end
end