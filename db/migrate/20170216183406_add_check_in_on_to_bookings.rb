class AddCheckInOnToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :check_in_on, :datetime
  end
end
