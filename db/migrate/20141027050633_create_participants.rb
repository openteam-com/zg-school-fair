class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :title,
               :category,
               :phone,
               :participant_type

      t.integer :space

      t.timestamps
    end
  end
end
