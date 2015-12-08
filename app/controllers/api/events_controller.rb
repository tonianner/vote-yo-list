module API
  class EventsController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    def index
      render json: Event.all
    end

    def show
      render json: Event.find(params[:id])
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
      event = Event.find(params[:id])
      if event.update(event_params)
        render json: event, status: 202
      else
        render json: event.errors, status: 422
      end
    end

    def destroy
      event = Event.find(params[:id])
      if event.destroy
        head 204
      else
        render json: event.erros, status: 422
      end
    end

    private
    def event_params
      params.require(:event).permit(:title, :due_date)
    end

  end
end
