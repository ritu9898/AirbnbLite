class BookingMailer < ApplicationMailer

	def new_booking
		@booking = params[:booking]
		 mail(:to => @booking.user&.email, :subject => "You've booked a property! ")
	end

	def booking_reminder
		@booking = params[:booking]
		 mail(:to => @booking.user&.email, :subject => "This is a reminder ! ")
	end

	def booking_confirm
		@booking = params[:booking]
		# binding.pry
		 # mail(:to => @booking.user&.email, :subject => "Your booking is confirmed!")
	end
end
