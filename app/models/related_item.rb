class RelatedItem < ActiveRecord::Base
  validates_presence_of :item_type, :item_id

  belongs_to :events
end
