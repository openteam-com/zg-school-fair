class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.timestamps
    end
  end
end
