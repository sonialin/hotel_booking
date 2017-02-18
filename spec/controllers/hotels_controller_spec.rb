require "rails_helper" 

RSpec.describe HotelsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/hotels'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      RestClient.get 'http://localhost:3000/hotels/2'
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