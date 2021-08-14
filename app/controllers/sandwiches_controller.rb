class SandwichesController < ApplicationController
    layout 'sandwich'
        
    def most_expensive
        @sandwiches = Sandwich.most_expensive
        render :index
    end

    def index
        @sandwiches = Sandwich.all
    end

    def show
        @sandwich = Sandwich.find(params[:id])
    end


    def new
        @sandwich = Sandwich.new
        @sandwich.build_category
    end

    def create
         @sandwich = Sandwich.new(sandwich_params)
         if @sandwich.save
            redirect_to sandwiches_path
         else
            render :new
         end
    end

    def edit
        @sandwich = Sandwich.find(params[:id])
    end

    def update
        @sandwich = Sandwich.find(params[:id])       
        if @sandwich.valid?
            @sandwich.update(sandwich_params)
            redirect_to sandwich_path(@sandwich)
        else
            render :edit
        end
    end

    def destroy
        @sandwich = Sandwich.find(params[:id])       
        @sandwich.destroy
        redirect_to sandwiches_path
    end

    private

    def sandwich_params
        params.require(:sandwich).permit(:price, :ingredient, :category_id, category_attributes: [:name])
    end
    
end