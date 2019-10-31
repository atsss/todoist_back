class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :task, null: false
      t.integer :kind
      t.integer :hour
      t.integer :minute

      t.timestamps

      t.datetime :deleted_at
    end

    add_index :schedules, :deleted_at
  end
end
