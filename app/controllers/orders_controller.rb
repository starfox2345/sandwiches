class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end
    
    def most_expensive
        @orders = Order.most_expensive
        render :index
    end

    def new
        @order = Order.new
        
    end

    def create
         @order = Order.create(order_params)
         if @order.save
            redirect_to orders_path
         else
            render :new
         end
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])       
        if @order.update(order_params)
            redirect_to order_path(@order)
        else
            render :edit
        end
    end

    def destroy
        @order = Order.find(params[:id])       
        @order.destroy
        redirect_to orders_path
    end

    private

    def order_params
        params.require(:order).permit(:name, :temperature, :price, :condition)
    end
    
end