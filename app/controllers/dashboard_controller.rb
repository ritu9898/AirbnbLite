class DashboardController < ApplicationController

	def index
		@properties = Property.all
		# @properties = Property.page params[:page]
	end

	def booking
	  respond_to do |format|
	  	format.js
	  end		
	end	

end
