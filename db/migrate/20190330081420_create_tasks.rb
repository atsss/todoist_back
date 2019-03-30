class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :name
      t.date :due_date
      t.date :done_at

      t.timestamps
    end
  end
end
