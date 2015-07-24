class RenameParticipatsTable < ActiveRecord::Migration
  def change
    rename_table :participants, :proposals
  end
end
