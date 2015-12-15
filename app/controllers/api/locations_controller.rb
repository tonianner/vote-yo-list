module API
  class LocationsController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    before_action :authenticate_user!
    before_action :set_event
    before_action :set_location, only: [:show, :update, :destroy, :vote]
    before_action :event_permission!

    def index # require user and permission
      render json: @event.locations
    end

    def show # require user and permission
      render json: @location
    end

    def create # require user and permission
      location = @event.locations.new(location_params)

      if location.save
        render json: location, status: 201
      else
        render json: location.errors, status: 422
      end
    end

    def update # require user and permission
      if @location.update(location_params)
        render json: @location, status: 202
      else
        render json: @location.errors, status: 422
      end
    end
# increment!(attribute, by = 1)
# @approval_period = ApprovalPeriod.find(params[:period])
# @approval_period.update_attribute("period_id", @approval.period_id + 1)
    def vote
      if params[:vote] == "upvote"
        # need to set schema to default 0 for + to work
        @location.update(votes: @location.votes+1)
        render json: @location, status: 201
      elsif params[:vote] == "downvote"
        @location.update(votes: @location.votes-1)
        render json: @location, status: 201
      else
        render json: {message: "please specify vote type"}, status: 400
      end
    end

    def destroy # require user and permission
      if @location.destroy
        head 204
      else
        render json: @location.errors, status: 422
      end
    end

  private
    def set_event
      @event = Event.find_by(id: params[:event_id])
      if @event.nil?
        render json: {message: "Event not found"}, status: 404
      end
    end

    def set_location
      @location = @event.locations.find_by(id: params[:id])
      if @location.nil?
        render json: {message: "Location not found"}, status: 404
      end
    end

    def location_params
      params.require(:location).permit(:place_name, :votes)
    end

    def event_permission!
      permission = @event.users.find_by(id: current_user.id)
      if permission.nil?
        render json: {message: "You don't have permission for this Event"}, status: 403
      end
    end

  end
end
