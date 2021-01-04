class BookingsController < ApplicationController

	def index
		@bookings = Booking.where(user_id: current_user.id)		
	end	

	def new
		# render => 'bookings/new'
		@property = Property.find(params[:property_id])
		@booking = Booking.new
	end

	def create
		# binding.pry
		@booking = Booking.new(book_params)
		# @booking.user_id = current_user.id
		# @booking.property_id = params[:property_id].to_i
		# @booking.time = "13:30"
		@booking.save!

		# binding.pry

		if @booking.save
		   BookingMailer.with(booking: @booking).new_booking.deliver_now
		   # redirect_to add_payment_method_path
		   redirect_to  property_bookings_path 
		else
			render 'new'
		end
	end

	private

	def book_params
		params.require(:booking).permit(:startdate, :enddate, :people, :user_id, :property_id)

	end

end
