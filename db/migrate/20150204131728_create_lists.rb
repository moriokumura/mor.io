class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer    :user_id, null: false
      t.string     :title, null: false
      t.string     :slug, null: false
      t.text       :description
      t.integer    :list_item_count, null: false, default: 0
      t.datetime   :published_at
      t.timestamps null: false
    end
    add_index :lists, :user_id
    add_index :lists, :slug, unique: true
  end
end
