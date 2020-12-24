class BookingsController < ApplicationController

	def index
		@bookings = Booking.where(user_id: current_user.id)		
	end	

	def new
		@bookings = Booking.new
	end

end
