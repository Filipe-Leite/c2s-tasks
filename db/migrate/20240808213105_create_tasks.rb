class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :task_status, null: false, foreign_key: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
