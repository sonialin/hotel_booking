class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show]

  def index
    @hotels = Hotel.all

    render json: @hotels
  end

  def show
    render json: @hotel
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end
end
