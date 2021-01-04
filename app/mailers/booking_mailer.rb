class BookingMailer < ApplicationMailer

	def new_booking
		@booking = params[:booking]
		 mail(:to => @booking.user&.email, :subject => "You've booked a property! ")
	end
end
