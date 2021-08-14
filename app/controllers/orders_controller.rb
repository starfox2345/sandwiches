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
        @sandwich = Sandwich.find_by_id(params[:sandwich_id])
        @order = @sandwich.orders.build
    end

    def create
        @sandwich = Sandwich.find_by_id(params[:sandwich_id])
         @order = Order.new(order_params)
         @order.user = current_user
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
        params.require(:order).permit(:delivery, :sandwich_id, sandwich_attributes: [:price, :ingredient] )
    end
    
end