class RelatedItem < ActiveRecord::Base
  validates_presence_of :item_type, :item_id

  belongs_to :events
end

# == Schema Information
#
# Table name: related_items
#
#  id         :integer          not null, primary key
#  item_type  :string(255)
#  item_id    :integer
#  event_id   :integer
#  created_at :datetime
#  updated_at :datetime
#
