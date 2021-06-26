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
    	# binding.pry

    	# @billing = Billing.new

		# if	BookingMailer.with(booking: @booking).booking_confirm.deliver_now
			# @booking.each do |booking|
			# 	Booking.destroy()
			# end
			# binding.pry
			# BookingMailer.with(booking: @booking).booking_confirm.deliver_now
			
			
      show
      # binding.pry
		 	redirect_to properties_path
			flash[:notice] = "Congratulations! Your booking has been confirmed. :)"

		# else
			# render 'new'
		# end
    	
    end

    def show
       respond_to do |format|
            format.html
            format.pdf do

              render pdf: "Booking Confirmed",
              page_size: 'A4',
              template: 'billing/show.html.erb',
              layout: 'pdf.html',
              orientation: "Landscape",
              lowquality: true,
              zoom: 1,
              dpi: 75
          end
        end 
    end
end
