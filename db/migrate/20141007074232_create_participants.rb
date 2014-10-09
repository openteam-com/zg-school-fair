class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :performer
      t.text :nomination
      t.text :auditory
      t.integer :age
      t.string :address
      t.string :phone
      t.string :email
      t.string :performance_name
      t.integer :music
      t.boolean :accept_terms
      t.timestamps
    end
  end
end
