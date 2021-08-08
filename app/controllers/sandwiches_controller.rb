class SandwichesController < ApplicationController

    def index
        @sandwiches = Sandwich.all
    end

    def show

    end
    
    def most_expensive

    end
end