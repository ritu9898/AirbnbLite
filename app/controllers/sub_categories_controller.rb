class SubCategoriesController < ApplicationController

	before_action :set_cat, only: [:show, :edit, :update, :destroy]

	def index
		@sub_categories = SubCategory.all
	end

	def new
		@sub_category = SubCategory.new
	end

	def create
		@sub_category = SubCategory.new(subcategory_params)
		# @sub_category.category_id = 15
		if @sub_category.save
			redirect_to sub_categories_path
		else
			render 'new'
		end
	end

	def show
	
	end

	def edit
	
	end

	def destroy
		@sub_category.destroy
		redirect_to sub_categories_path
	end

	private

	def subcategory_params
		params.require(:sub_category).permit(:category_id ,:name, :status)
	end

	def set_cat
     	@sub_category = SubCategory.find(params[:id])
	end

end
