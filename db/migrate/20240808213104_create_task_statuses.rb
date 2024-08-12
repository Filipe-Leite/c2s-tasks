class CreateTaskStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :task_statuses do |t|
      t.string :description

      t.timestamps
    end
  end
end
