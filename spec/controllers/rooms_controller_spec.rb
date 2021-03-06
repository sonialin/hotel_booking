require "rails_helper" 

RSpec.describe RoomsController, :type => :controller do
  describe "GET #index" do
    it "responds to listing request successfully with an HTTP 200 status code" do
      begin
        RestClient.get 'http://localhost:3000/rooms'
      rescue
        puts 'There\'s something wrong.'
      end

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
      
      2000.times do
        number_of_requests += 1       
        begin
          RestClient.get 'http://localhost:3000/rooms/1'
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
          RestClient.get 'http://localhost:3000/rooms/1'
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
        :name  => "Good Vibes",
        :success    => true,
        :hotel_id => 1
      }.to_json
      
      RestClient.get 'http://localhost:3000/rooms/1'
      response.body == @expected
    end
  end
end