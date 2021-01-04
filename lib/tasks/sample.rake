namespace :sample do
  desc "TODO"
  task send_email: :environment do
  	# puts 'hi cron :)'
  	 BookingMailer.with(booking: @booking).new_booking.deliver_now
  end

end
