# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hotel.create(name: 'Comfort Inn & Suites', 
              address: '2485 Hotel Circle Place, Mission Valley, San Diego, CA 92108',
              phone_number: '(619) 881-6200')
Hotel.create(name: 'The Bed & Breakfast Inn at La Jolla', 
              address: '7753 Draper Avenue, La Jolla, San Diego, CA 92037',
              phone_number: '(858) 456-2066')
Hotel.create(name: 'Surfer Beach Hotel', 
              address: '711 Pacific Beach Dr, San Diego, CA 92109',
              phone_number: '(858) 483-7070')

Room.create(name: 'Good Vibes', hotel_id: 1)
Room.create(name: 'Have a Great Day', hotel_id: 1)
Room.create(name: 'You & Me', hotel_id: 1)
Room.create(name: 'My Jam', hotel_id: 1)
Room.create(name: 'Like a Baws', hotel_id: 1)

Room.create(name: 'Over Easy', hotel_id: 2)
Room.create(name: 'Slightly Toasted', hotel_id: 2)
Room.create(name: 'Sunnyside Up', hotel_id: 2)
Room.create(name: 'Bottomless', hotel_id: 2)
Room.create(name: 'With Cream No Sugar', hotel_id: 2)

Room.create(name: 'Only the Ocean', hotel_id: 3)
Room.create(name: 'Good People', hotel_id: 3)
Room.create(name: 'Snow Hey Oh', hotel_id: 3)
Room.create(name: 'Let Your Hair Down', hotel_id: 3)
Room.create(name: 'Californication', hotel_id: 3)

User.create(
    :email                 => "abc123@luc.edu",
    :password              => "comp439",
    :password_confirmation => "comp439"
)

Booking.create(room_id: 1, user_id: 1, check_in_on: "2016-02-06 17:00:00", check_out_on: "2016-02-08 11:00:00")

