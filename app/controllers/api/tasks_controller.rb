module API
  class TasksController < ApplicationController
    # Status: 422 unprocessable Entity

    # Status: 204 no content
    # Status: 202 accepted
    # Status: 201 created
    # Status: 200 ok

    def index
      render json: Task.all
    end

    def show
      render json: Event.find(params[:id])
    end

    def create
      task = Task.new(task_params)
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
      task = Task.find(params[:id])
      if task.update(task_params)
        render json: task, status: 202
      else
        render json: task.errors, status: 422
      end
    end

    def destroy
      task = Task.find(params[:id])
      if task.destroy
        head 204
      else
        render json: task.erros, status: 422
      end
    end

    private
    def task_params
      params.require(:task).permit(:title, :description, :completed)
    end

  end
end
