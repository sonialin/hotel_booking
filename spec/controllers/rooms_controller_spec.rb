require "rails_helper" 

RSpec.describe RoomsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/rooms'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/rooms/1'
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