class CategoriesController < ApplicationController
    layout 'category'

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        redirect_if_not_logged_in?
        @category = Category.new
        @category.sandwiches.build
    end

    def create
        @category = Category.new(category_params)
        if @category.save
           redirect_to categories_path
        else
           render :new
        end
   end

   def edit
        redirect_if_not_logged_in?
       @category = Category.find(params[:id])
   end

   def update
       @category = Category.find(params[:id])       
       if @category.update(category_params)
           redirect_to category_path(@category)
       else
           render :edit
       end
   end

   def destroy
       redirect_if_not_logged_in?
       @category = Category.find(params[:id])     
       redirect_if_not_authorized  
       @category.destroy
       redirect_to categories_path
   end

   private

   def category_params
        params.require(:category).permit(:name, :sandwich_id, sandwiches_attributes: [:ingredient, :price], orders_attributes: [:delivery])
   end

end