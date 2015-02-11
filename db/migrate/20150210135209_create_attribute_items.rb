class CreateAttributeItems < ActiveRecord::Migration
  def change
    create_table :attribute_items do |t|
      t.string     :target_type, null: false
      t.integer    :target_id, null: false
      t.string     :key, null: false
      t.string     :title, null: false
      t.text       :body
      t.integer    :position, null: false
      t.timestamps null: false
    end
    add_index :attribute_items, [:target_type, :target_id, :key], unique: true
    add_index :attribute_items, :position
  end
end
