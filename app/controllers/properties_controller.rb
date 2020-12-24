class PropertiesController < ApplicationController

before_action :authenticate_user!

def index
	# @properties = Property.order(created_at: :desc).page(params[:page]).per(5)
	
	@properties = Property.page params[:page]
	# binding.pry
end

def new
	@property = Property.new
end

def edit
	@property = Property.find(params[:id])
end

def update
	@property = Property.find(params[:id])
	if @property.update(property_params)
		redirect_to properties_path
	else
		render 'edit'
	end

end

def show
	
	@property = Property.find(params[:id])
end

def create
	
	# binding.pry
	@property = Property.new(property_params)
	
	@property.user_id = current_user&.id
	# @property.image.attach(property_params[:image])
	# puts "Coming"
	# binding.pry
	if @property.save
		redirect_to properties_path
	else
		
		render 'new'
	end
end

private

def property_params
	params.require(:property).permit(:name,:location,:cost,:people,:description, :sub_category_id, :image, :image1, :image2, :image3, :search)
	
end

end
