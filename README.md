# README

This is a web services app built in Ruby on Rails that is a simplified version of a hotel booking site.

The following steps are required after cd'ing into the project directory.

1. Install dependency  
bundle install

2. Set up db and load seed data  
rake db:setup

3. Run rails server  
rails s

To simulates a client app's actions, unit tests are available.

4. Run unit tests (all)
bundle exec rspec

5. To run individual tests:
rspec spec/controllers/rooms_controller_spec.rb -e "responds to listing request successfully with an HTTP 200 status code"

Replace the above command with the desired controller and the test