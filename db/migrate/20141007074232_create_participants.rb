class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.boolean :accept_terms
      t.timestamps
    end
  end
end
