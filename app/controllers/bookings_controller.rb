class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.all

    render json: @bookings
  end

  def show
    render json: @booking
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :comment, :check_out_on, :check_in_on)
    end
end
