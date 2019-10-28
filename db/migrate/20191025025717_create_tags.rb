class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps

      t.datetime :deleted_at
    end

    add_index :tags, :deleted_at
  end
end
