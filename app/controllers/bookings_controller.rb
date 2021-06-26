class BookingsController < ApplicationController

	def index
		@bookings = Booking.where(user_id: current_user.id)		
	end	

	def new
		@property = Property.find(params[:property_id])
		@booking = Booking.new
	end

	def create
		@property = Property.find(params[:property_id])
		@booking = Booking.new(book_params)
		@booking.total = count(@booking.startdate, @booking.enddate, @booking.property&.cost)
		
		# @booking.save!

		# binding.pry

		if @booking.save
		   BookingMailer.with(booking: @booking).new_booking.deliver_now
		   # redirect_to add_payment_method_path
		   # redirect_to  property_bookings_path 
		   # redirect_to billing_property_bookings_path
		   # redirect_to property_booking_billing_index_path
		   # redirect_to billing_index_path
		   redirect_to new_billing_path

		else
			render 'new'
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to properties_path	
	end


	def count(sd, ed, prop)
		 $total = 0 
 $grand_total = 0
 $diff 
		$sd = sd.split('-',3) 
        $ed = ed.split('-',3) 
        $month = 0

        case $sd[1].to_i
        	when 1,3,5,7,8,10,12
                $month = 31
            when 4,6,9,11
                $month = 30
            end 
               
         if $sd[2] > $ed[2]
            $diff = ($month - $sd[2].to_i) + ($ed[2].to_i - 1)
         else
            $diff = $ed[2].to_i - $sd[2].to_i 
         end
              

         $total = prop * $diff 
         $grand_total += $total 

          return $grand_total

	end

	private

	def book_params
		params.require(:booking).permit(:startdate, :enddate, :people, :user_id, :property_id)

	end

end
