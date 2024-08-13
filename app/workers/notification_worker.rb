class NotificationWorker
  include Sidekiq::Worker

  def perform(task_id)
    task = Task.find(task_id)

    notification_data = {
      description: "Task #{task.id} foi atualizada",
      user_id: task.user_id
    }

    Faraday.post('http://127.0.0.1:3002/create_task_notification', 
                 notification_data.to_json, 
                 "Content-Type" => "application/json")
  end
end
