class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :performer
      t.string :nomination
      t.string :auditory
      t.integer :age
      t.string :address_index
      t.string :address_area
      t.string :address_district
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :address_housing
      t.string :address_flat
      t.string :phone
      t.string :email
      t.string :performance_name
      t.string :music
      t.boolean :accept_terms
      t.timestamps
    end
  end
end
