class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

   # validates :name, presence: true, length: {minimum: 4 , maximum: 10}

   validate :validate_data
    validates :startdate, :enddate, presence: true
  validate :end_date_after_start_date
  validate :validate_other_booking_overlap



  def period
    startdate..enddate
  end


  private

 
  def validate_other_booking_overlap
    other_bookings = Booking.all
    is_overlapping = other_bookings.any? do |other_booking|
      period.overlaps?(other_booking.period)
    end
    # errors.add(:overlaps_with_other) if is_overlapping
      errors.add(:startdate, "Overlaps with other booking...") if is_overlapping
      # errors.add(:startdate, "#{:name || 'Date'} not available") if is_overlapping
  end

  def end_date_after_start_date
    return if enddate.blank? || startdate.blank?

    if startdate < Date.today.to_s
      errors.add(:startdate, "Start date must be from today.")
    elsif enddate < startdate
      errors.add(:enddate, "must be after the start date")
    end
  end

   def validate_data
   	bookings = Booking.where(startdate: :string, enddate: :string, people: :integer)
   	# puts "Yeayyy"
   end



   # protected

   #  def validate_other_booking_overlap
   #    sql = "daterange(startdate, enddate, '[]') && daterange(:startdate, :enddate, '[]')"
   #    is_overlapping = Booking.where(sql, startdate: c.startdate, enddate: c.enddate).exists?
   #    errors.add(:overlaps_with_other) if is_overlapping
   #  end

end


