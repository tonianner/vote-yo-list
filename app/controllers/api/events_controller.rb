module API
  class EventsController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    before_action :authenticate_user!
    before_action :set_event, except: [:index, :create]
    # before_action :event_permission!, except: [:create]

    def index # requires user
      render json: current_user.events
    end

    def show # requires user
      render json: @event
    end

    def create # requires user
      event = Event.new(event_params)
      event.users << current_user

      if event.save
        render json: event, status: 201
      else
        render json: event.errors, status: 422
      end
    end

    def update # requires user
      if @event.update(event_params)
        render json: @event, status: 202
      else
        render json: @event.errors, status: 422
      end
    end

    def destroy # requires user
      if @event.destroy
        head 204
      else
        render json: @event.errors, status: 422
      end
    end

    private
    def event_params
      params.require(:event).permit(:title, :due_date)
    end

    def set_event
      @event = Event.find_by(id: params[:id])
      if @event.nil?
        render json: {msessage: "Event Not Found"}, status: 404
      end
    end

    def event_permission!
      permission = @event.users.find_by(id: current_user.id)
      if permission.nil?
        render json: {message: "You don't have permission for this Event"}, status: 403
      end
    end

  end
end
