class SandwichesController < ApplicationController

    def index
        @sandwiches = Sandwich.all
    end

    def show
        @sandwich = Sandwich.find(params[:id])
    end
    
    def most_expensive
        @sandwiches = Sandwich.most_expensive
        render :index
    end

    def new

    end

    def create

    end

    
end