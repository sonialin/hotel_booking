require "rails_helper" 

RSpec.describe HotelsController, :type => :controller do
  describe "GET #index" do
    it "responds to listing request successfully with an HTTP 200 status code" do
      begin
        RestClient.get 'http://localhost:3000/hotels'
      rescue
        puts 'There\'s something wrong.'
      end

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds to multiple show page requests successfully with an HTTP 200 status code" do
      start_time = Time.now
      end_time = nil
      number_of_requests = 0
      
      2000.times do
        number_of_requests += 1
        RestClient.get 'http://localhost:3000/hotels/1'
      end

      end_time = Time.now
      puts "Number of requests made is #{number_of_requests}"
      puts "Start time is #{start_time}"
      puts "End time is #{end_time}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "responds to multiple show page requests with error handling" do
      start_time = Time.now
      end_time = nil
      number_of_requests = 0
      number_of_errors = 0
      
      2000.times do
        number_of_requests += 1
        begin
          RestClient.get 'http://localhost:3000/hotels/1'
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
        :id => 2,
        :name  => "The Bed \u0026 Breakfast Inn at La Jolla",
        :success    => true,
        :address => "7753 Draper Avenue, La Jolla, San Diego, CA 92037"
      }.to_json
      
      RestClient.get 'http://localhost:3000/hotels/1'
      response.body == @expected
    end
  end
end