class FixTasksColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :done_at, :datetime, after: :due_date
    remove_column :tasks, :due_date, :datetime, after: :name
    remove_reference :accounts, :user, null: false, index: true, after: :uid

    add_column :tasks, :kind, :string, after: :name
    add_column :tasks, :hour, :integer, after: :kind
    add_column :tasks, :minute, :integer, after: :hour
    add_reference :users, :account, null: false, index: true, after: :id
  end
end