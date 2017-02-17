class AddHotelToRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :hotel, foreign_key: true
  end
end
