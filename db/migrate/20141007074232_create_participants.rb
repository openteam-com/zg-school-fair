class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :performer
      t.string :nomination
      t.string :auditory
      t.integer :age
      t.string :address
      t.string :phone
      t.string :email
      t.string :performance_name
      t.string :music
      t.boolean :accept_terms
      t.timestamps
    end
  end
end
