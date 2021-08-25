class SandwichesController < ApplicationController
    before_action :find_sandwich, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]


    layout 'sandwich'
        
    def most_expensive
        @sandwiches = Sandwich.most_expensive
        render :index
    end

    def index
        @orders = Order.find_by_id(params[:order_id])
        @sandwiches = Sandwich.all
    end

    def show
        redirect_if_not_logged_in?
        @sandwich = Sandwich.find(params[:id]) 
  
    end


    def new
        redirect_if_not_logged_in?
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
        @sandwich = Sandwich.find_by_id(params[:id])
    end

    def update
        @sandwich = Sandwich.find_by_id(params[:id])       
        if @sandwich.valid?
            @sandwich.update(sandwich_params)
            redirect_to sandwich_path(@sandwich)
        else
            render :edit
        end
    end

    def destroy
        @sandwich = Sandwich.find_by_id(params[:id])
        @sandwich.destroy
        redirect_to sandwiches_path
    end

    private

    def find_sandwich
        @sandwich = Sandwich.find(params[:id]) rescue not_found
    end

    def sandwich_params
        params.require(:sandwich).permit(:price, :ingredient, :category_id, category_attributes: [:name])
    end

    def redirect_if_not_authorized
        
        if @sandwich.users != current_user
            byebug
            redirect_to sandwiches_path
            
        end
    end

end