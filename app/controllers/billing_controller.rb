class BillingController < ApplicationController

	def new
		# @booking = Booking.where(user_id: current_user.id)
		@booking = Booking.last
    end

    def create
		# @booking = Booking.where(user_id: current_user.id)
		@booking = Booking.last		
    	# @bokkings.each do |booking|
    	# 	@billing = Billing.new
    	# 	@billing.name= @booking.name
    	# end
    	binding.pry

    	# @billing = Billing.new

		if	BookingMailer.with(booking: @booking).booking_confirm.deliver_now
			# @booking.each do |booking|
			# 	Booking.destroy()
			# end
		 	redirect_to properties_path
			flash[:notice] = "Congratulations! Your booking has been confirmed. :)"
		else
			render 'new'
		end
    	
    end
end
