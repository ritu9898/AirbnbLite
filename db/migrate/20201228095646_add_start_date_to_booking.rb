class AddStartDateToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :startdate, :string
    add_column :bookings, :enddate, :string
  end
end
