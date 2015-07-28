class AddContactPersonToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :contact, :string
  end
end
