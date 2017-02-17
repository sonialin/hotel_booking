class AddCheckOutOnToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :check_out_on, :datetime
  end
end
