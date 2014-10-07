class Event < ActiveRecord::Base
  has_many :related_items
end
