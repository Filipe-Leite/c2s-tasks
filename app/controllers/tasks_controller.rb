class TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: tasks.as_json(include: {task_status: {}})
  end

  def create
    
    merged_task_params = task_params.merge(task_status_id: 1)

    task = Task.new(merged_task_params)
    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update

    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy

    task = Task.find(params[:id])
    task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:id, :url, :task_status_id)
  end
end
