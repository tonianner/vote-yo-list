module API
  class TasksController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    before_action :authenticate_user!
    before_action :set_event
    before_action :set_task, only: [:show, :update, :destroy]
    before_action :event_permission!

    def index # require user and permission
      render json: @event.tasks
    end

    def show # require user and permission
      render json: @task
    end

    def create # require user and permission
      task = @event.tasks.new(task_params)
      if task.save
        render json: task, status: 201
      else
        render json: task.errors, status: 422
      end
    end

    def update # require user and permission
      if @task.update(task_params)
        render json: @task, status: 202
      else
        render json: @task.errors, status: 422
      end
    end

    def destroy # require user and permission
      if @task.destroy
        head 204
      else
        render json: @task.errors, status: 422
      end
    end

  private
    def set_event
      @event = Event.find_by(id: params[:event_id])
      if @event.nil?
        render json: {message: "Event not found"}, status: 404
      end
    end

    def set_task
      @task = @event.tasks.find(params[:id])
      if @task.nil?
        render json: {message: "Task not found"}, status: 404
      end
    end

    def task_params
      params.require(:task).permit(:title, :description, :completed, :due_date)
    end

    def event_permission!
      permission = @event.users.find_by(id: current_user.id)
      if permission.nil?
        render json: {message: "You don't have permission for this Event"}, status: 403
      end
    end
  end
end
