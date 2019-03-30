class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :name
      t.datetime :due_date
      t.datetime :done_at

      t.timestamps
    end
  end
end
