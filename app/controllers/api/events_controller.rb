module API
  class EventsController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok
    before_action :authenticate_user!
    before_action :set_event, except: [:index, :create]
    before_action :event_permission!, except: [:index, :create]

    def index
      render json: Event.all
    end

    def show
      render json: @event
    end

    def create
      event = Event.new(event_params)
      if event.save
        render json: event,
        status: 201,
        location: [:api, event]
      else
        render json: event.errors,
        status: 422,
        location: [:api, event]
      end
    end

    def update
      if @event.update(event_params)
        render json: @event, status: 202
      else
        render json: @event.errors, status: 422
      end
    end

    def destroy
      if @event.destroy
        head 204
      else
        render json: @event.erros, status: 422
      end
    end

    private
    def event_params
      params.require(:event).permit(:title, :due_date)
    end

    def set_event
      @event = Event.find_by(id: params[:id])
      if @event.nil?
        render json: {message: "Event Not Found"}, status: 404
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
