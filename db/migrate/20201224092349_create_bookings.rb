class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.integer :people
      t.integer :total

      t.timestamps
    end
  end
end
