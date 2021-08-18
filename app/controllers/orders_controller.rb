class OrdersController < ApplicationController
    

    def index     
        if params[:sandwich_id] && @sandwich = Sandwich.find_by_id(params[:sandwich_id])
            @orders = @sandwich.orders
        else
            @orders = Order.all
        end
    end

    def show
        @order = Sandwich.find_by_id(params[:sandwich_id])
        # @order = Order.find_by_id(params[:id])
    end
    
    def most_expensive
        @orders = Order.most_expensive
        render :index
    end

    def new
        if params[:sandwich_id] && @sandwich = Sandwich.find_by_id(params[:sandwich_id])
            @order = @sandwich.orders.build
        else
            @order = Order.new
            @order.build_sandwich
        end
    end

    def create
        @order = Order.new(order_params)
        @order.user = current_user
        if params[:sandwich_id]
            @sandwich = Sandwich.find_by_id(params[:sandwich_id])
        end

        if @order.save
            redirect_to orders_path
        else
            render :new
        end
    end

    def edit
        @order = Order.find_by(params[:id])
        
    end

    def update
        @order = Order.find_by(params[:id])
        if @order.valid?
            @order.update(order_params)
            redirect_to order_path(@order)
        else
            render :edit
        end
    end

    def destroy
        @order = Order.find_by(params[:id])       
        @order.destroy
        redirect_to orders_path
    end

    private

    def order_params
        params.require(:order).permit(:delivery, :sandwich_id, sandwich_attributes: [:price, :ingredient])
    end
    
end