class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  BAD_REQUEST_SELECTION = 2 #randomly designated number out of 10 that stipulates an error should be thrown
  BAD_REQUEST_SELECTION2 = [1]

  def index
    request_selection = (1..10).to_a.sample

    if BAD_REQUEST_SELECTION2.include? request_selection
      raise 'error'
    else
      @bookings = Booking.all
      render json: @bookings
    end
  end

  def show
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      render json: @booking
    end
  end

  def create
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      @booking = Booking.new(booking_params)
    end

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
