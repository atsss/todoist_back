class MoveUserInformationColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :string, after: :email
    remove_column :users, :email, :string, after: :name

    remove_column :accounts, :image, :string, after: :nickname
    remove_column :accounts, :nickname, :string, after: :name
    remove_column :accounts, :name, :string, after: :remember_created_at
    add_reference :accounts, :user, index: true, null: false, after: :uid
  end
end
