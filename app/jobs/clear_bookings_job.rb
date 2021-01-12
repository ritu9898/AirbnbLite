class ClearBookingsJob < ApplicationJob
  queue_as :default

  # Deletes old booking data
  def perform()
    # Booking.where('enddate <?',d)
    @bookings = Booking.where('enddate <?',Date.today.strftime)

    @bookings.each do |book|
    	Booking.delete(book.id)
    end
  end
end
