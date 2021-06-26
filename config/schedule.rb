# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
set :environment, 'development'

# Learn more: http://github.com/javan/whenever
set :output, "log/cron.log"

# every 1.minute do 
# 	#task will go here
# 	# puts 'Hello'
# 	rake 'sample:send_email'
# end

every 1.day, :at => "12:00 PM" do

	# Delete old bookings
	# runner "ClearBookingsJob.perform_later"

	#
	bookings = Booking.all

	# for i in 0..b.length
	bookings.each do |book|
		sd = book.startdate
		ed = book.enddate

		if Date.parse(ed) < Date.today
			book.destroy
		end

		if Date.parse(sd) == Date.today - 1
			rake 'sample:send_email'
		end
	end

	# t = Time.now.strftime("%d/%m/%Y %H:%M")
	# a = t.split('/',3)

end


