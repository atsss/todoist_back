class CreateTagTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_tasks do |t|
      t.references :tag, null: false
      t.references :task, null: false

      t.timestamps

      t.datetime :deleted_at
    end

    add_index :tag_tasks, :deleted_at
    add_index :tag_tasks, %i(tag_id task_id), unique: true
  end
end
