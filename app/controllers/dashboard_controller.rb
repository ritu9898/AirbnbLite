class DashboardController < ApplicationController

	def index

		if current_user.has_role? :host
			@properties = Property.all.where(user_id: current_user)
			@bookings = Booking.all
		elsif current_user.has_role? :tenant
			
			@bookings = Booking.where(user_id: current_user.id)
			@properties = Property.all

		else
		end	
	end

	def booking
	  respond_to do |format|
	  	format.js
	  end		
	end	
	

end
