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

# Learn more: http://github.com/javan/whenever
set :output, "log/cron.log"

# every 1.minute do 
# 	#task will go here
# 	rake 'sample:send_email'
# end

every 1.day, :at => Time.now do
	b = Booking.all
	for i in 0..b.length
		ed = b.enddate
		if Date.parse(ed) < Date.today - 1
			rake 'sample:send_email'
		end
	end

	# t = Time.now.strftime("%d/%m/%Y %H:%M")
	# a = t.split('/',3)

end
