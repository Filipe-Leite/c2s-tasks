namespace :db do
  desc "Populate user types and tasks status"
  task populate: :environment do

    puts "Started to populate tables..."

    if TaskStatus.all.length == 0 
      task_statuses = ['Pending', 'In Progress', 'Completed', 'Failed']
      task_statuses.each do |status|
        TaskStatus.find_or_create_by(description: status)
      end
    end

    if Task.all.length == 0

      10.times do 
        Task.create!(
          task_status_id: TaskStatus.pluck(:id).sample,
          url: "www.url.com/produto"
        )
      end
    end

    puts "Tables was populated successfully!"
  end
end