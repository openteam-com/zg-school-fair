class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :full_name
      t.text :description
      t.string :nomination
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.text :image_url
      t.timestamps
    end
  end
end
