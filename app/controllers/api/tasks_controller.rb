module API
  class TasksController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    before_action :set_event

    def index
      render json: @event.tasks
    end

    def show
      render json: @event.tasks.find(params[:id])
    end

    def create
      task = @event.tasks.create(task_params)
      task.event_id = current_event.id

      if task.save
        render json: task,
        status: 201,
        location: [:api, task]
      else
        render json: task.errors,
        status: 422,
        location: [:api, task]
      end
    end

    def update
      task = @event.tasks.find(params[:id])
      if task.update(task_params)
        render json: task, status: 202
      else
        render json: task.errors, status: 422
      end
    end

    def destroy
      task = @event.tasks.find(params[:id])
      if task.destroy
        head 204
      else
        render json: task.erros, status: 422
      end
    end

    private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :completed)
    end

  end
end
