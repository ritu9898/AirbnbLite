class AirbnbController < ApplicationController

def index
	
end

def profile
	
end

def about
		
end	

def game
	if current_user.discount != nil
		current_user.update(discount: params[:discount].to_i)
	end
	# binding.pry
end

def home
	
end

end
