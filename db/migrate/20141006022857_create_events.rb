class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title,
               :slug,
               :category

      t.timestamps
    end

    Event.create! title: 'School fair About'
    Event.create! title: 'School fair Participants'
  end
end
