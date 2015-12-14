module API
  class LocationsController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    before_filter :set_event

    def index
      render json: @event.locations
    end

    def show
      render json: @event.locations.find(params[:id])
    end

    def create
      location = @event.locations.new(location_params)

      if location.save
        render json: location,
        status: 201
      else
        render json: location.errors,
        status: 422
      end
    end

    def update
      location = @event.locations.find(params[:id])
      if location.update(location_params)
        render json: location, status: 202
      else
        render json: location.errors, status: 422
      end
    end

    def destroy
      location = @event.locations.find(params[:id])
      if location.destroy
        head 204
      else
        render json: location.erros, status: 422
      end
    end

    private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def location_params
      params.require(:location).permit(:place_name, :votes)
    end

  end
end
