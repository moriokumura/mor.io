class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer    :list_id, null: false
      t.string     :title, null: false
      t.string     :subtitle
      t.string     :url
      t.text       :description
      t.integer    :position, null: false
      t.timestamps null: false
    end
    add_index :list_items, :list_id
    add_index :list_items, :position
  end
end
