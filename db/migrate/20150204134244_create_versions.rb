class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string   :item_type, null: false
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit, null: false
      t.json     :object          # Full object changes
      t.json     :object_changes  # Optional column-level changes
      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]
  end
end
