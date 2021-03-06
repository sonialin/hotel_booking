require "rails_helper" 

RSpec.describe BookingsController, :type => :controller do
  describe "GET #index" do
    it "responds to listing request successfully with an HTTP 200 status code" do
      number_of_errors = 0
      current_wait_time = 0
      number_of_requests = 0

      def wait_time(nth_error)
        1 + (nth_error - 1) * 2
      end

      def num_with_pluralized_word(num, noun)
        num.to_s + ' ' + noun.pluralize(num)
      end

      begin
        number_of_requests += 1
        RestClient.get 'http://localhost:3000/bookings'
      rescue
        number_of_errors += 1
        current_wait_time = wait_time(number_of_errors)
        puts 'Something\'s wrong.'
        puts "Retrying in #{num_with_pluralized_word(current_wait_time, 'second')}."
        sleep(current_wait_time)
        retry
      end

      puts "Request successful after #{num_with_pluralized_word(number_of_requests, 'try')}."
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds to multiple show page requests with error handling" do
      start_time = Time.now
      end_time = nil
      number_of_requests = 0
      number_of_errors = 0
      
      100.times do
        number_of_requests += 1       
        begin
          RestClient.get 'http://localhost:3000/bookings/1'
        rescue
          puts 'Something is wrong.'
          number_of_errors += 1
        end     
      end

      end_time = Time.now
      puts "Number of requests made is #{number_of_requests}"
      puts "Number of errors encountered is #{number_of_errors}"
      puts "Start time is #{start_time}"
      puts "End time is #{end_time}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "responds to multiple show page requests with error threshold" do
      start_time = Time.now
      end_time = nil
      number_of_requests = 0
      number_of_errors = 0
      
      2000.times do
        number_of_requests += 1
        begin
          RestClient.get 'http://localhost:3000/bookings/1'
        rescue
          puts 'Something is wrong.'
          number_of_errors += 1
        end

        break if number_of_errors == 5
      end

      end_time = Time.now
      puts "Number of requests made is #{number_of_requests}"
      puts "Number of errors encountered is #{number_of_errors}"
      puts "Start time is #{start_time}"
      puts "End time is #{end_time}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "retrieves the entry with the expected values" do
      @expected = { 
        :id => 1,
        :user_id => 1,
        :success    => true,
        :hotel_id => 1
      }.to_json
      
      RestClient.get 'http://localhost:3000/bookings/1'
      response.body == @expected
    end
  end

  describe "POST #create" do
    it "saves the booking record" do
      booking_params = { room_id: 3, user_id: 34, comment: 'Will call before arrival', 
                        check_in_on: "2017-02-10 20:00:00", check_out_on: "2017-02-13 10:00:00" }

      begin
        response = RestClient.post 'http://localhost:3000/bookings', :booking => booking_params
      rescue
        puts 'There\'s something wrong.'
      end
      
      response.code == 201
    end
  end
end