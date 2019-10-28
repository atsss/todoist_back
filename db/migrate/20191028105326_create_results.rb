class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :tag, null: false
      t.integer :score, null: false, default: 0
      t.datetime :done_at

      t.timestamps
    end
  end
end
