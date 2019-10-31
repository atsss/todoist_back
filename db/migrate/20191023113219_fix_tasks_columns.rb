class FixTasksColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :done_at, :datetime, after: :due_date
    remove_column :tasks, :due_date, :datetime, after: :name
    remove_reference :accounts, :user, null: false, index: true, after: :uid

    add_column :tasks, :duration, :integer, after: :name
    add_column :tasks, :deleted_at, :datetime, after: :updated_at
    add_index :tasks, :deleted_at
    add_reference :users, :account, null: false, index: true, after: :id
  end
end
