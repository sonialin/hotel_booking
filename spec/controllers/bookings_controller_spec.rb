require "rails_helper" 

RSpec.describe BookingsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/bookings'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/bookings/1'
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
      booking_params = { room_id: 3, user_id: 1, comment: 'Will call before arrival', 
                        check_in_on: "2017-02-10 20:00:00", check_out_on: "2017-02-13 10:00:00" }
      response = RestClient.post 'http://localhost:3000/bookings', :booking => booking_params
      response.code == 201
    end
  end
end