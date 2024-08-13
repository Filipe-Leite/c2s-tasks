module NotificationsMicroservice

  def self.create_notification(user_id, user_email, task_obj, new_task_status_description)

    description_param = write_description(user_email, task_obj[:id], new_task_status_description)

    Faraday.post("http://127.0.0.1:3002/create_task_notification", {description: description_param,
                                                                    email: user_email,
                                                                    task_id:task_obj[:id],
                                                                    user_id: user_id})

  end

  private

  def self.write_description(user_email, task_id, new_task_status_description)
    return "#{user_email} changed the task #{task_id} to #{new_task_status_description} status"
  end

end