class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  BAD_REQUEST_SELECTION = 2 #randomly designated number out of 10 that stipulates an error should be thrown

  def index
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      @rooms = Room.all
      render json: @rooms
    end
  end

  def show
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      render json: @room
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
end
