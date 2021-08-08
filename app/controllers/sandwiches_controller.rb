class SandwichesController < ApplicationController

    def index
        @sandwiches = Sandwich.all
    end

    def show
        @sandwich = Sandwich.find(params[:id])
    end
    
    def most_expensive
        @sandwiches = Sandwich.order_by_price
        render :index
    end
end