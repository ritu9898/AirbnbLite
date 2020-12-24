class CategoriesController < ApplicationController

before_action :set_cat, only: [:show, :edit, :update, :destroy]

def index
	@categories = Category.all
end

def new
	@category = Category.new
end

def show
	
end

def edit
	
end

def create
	@category = Category.new(category_params)
	if @category.save
		redirect_to categories_path
	else
		render 'new'
	end
end

def destroy
	@category.destroy
	redirect_to categories_path
end


private

def category_params
	params.require(:category).permit(:name, :status)
end

def set_cat
     @category = Category.find(params[:id])
end

end

