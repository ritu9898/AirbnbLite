namespace :sample do
  desc "TODO"
  task send_email: :environment do
  	# puts 'hi cron :)'
  	 BookingMailer.with(booking: @booking).booking_reminder.deliver_now
  end

end
