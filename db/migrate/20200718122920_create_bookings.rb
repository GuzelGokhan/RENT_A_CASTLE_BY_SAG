class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :checkin_on
      t.date :checkout_on
      t.integer :value
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :castle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
