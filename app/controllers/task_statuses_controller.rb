class TaskStatusesController < ApplicationController

  def index
    task_statuses = TaskStatus.all
    render json: task_statuses
  end

end
