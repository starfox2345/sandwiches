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
         @sandwich = Sandwich.create(sandwich_params)
         if @sandwich.save
            redirect_to sandwiches_path
         else
            render :new
         end
    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:name, :temperature, :price, :condition)
    end
end