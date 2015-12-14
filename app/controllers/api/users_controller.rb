module API
  class UsersController < ApplicationController

    before_action :set_event

    def index
      # render json: @event.users
      # @user = User.includes(:event).find_by(id: params[:event_id])
      @event.users
      render 'index.json.jbuilder'
    end

    def show
      render json: @event.users.find(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:nickname, :email)
    end

    def set_event
      @event = Event.find_by(id: params[:event_id])
    end

  end
end
