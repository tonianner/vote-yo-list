module API
  class UsersController < ApplicationController
    before_action :set_event

    def index
      @users = @event.users
      render 'index.json.jbuilder'
    end

  private
    def set_event
      @event = Event.find_by(id: params[:event_id])
      if @event.nil?
        render json: {message: "Event not found"}, status: 404
      end
    end
  end
end
