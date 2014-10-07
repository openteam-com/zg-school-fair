class CreateRelatedItems < ActiveRecord::Migration
  def change
    create_table :related_items do |t|
      t.string :item_type
      t.integer :item_id
      t.belongs_to :event
      t.timestamps
    end
  end
end
