class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  BAD_REQUEST_SELECTION = 2 #randomly designated number out of 10 that stipulates an error should be thrown

  def index
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      @users = User.all
      render json: @users
    end
  end

  def show
    request_selection = (1..10).to_a.sample

    if request_selection == BAD_REQUEST_SELECTION
      raise 'error'
    else
      render json: @user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
