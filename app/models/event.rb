class Event < ActiveRecord::Base
  attr_accessor :related, :related_link, :related_title

  has_many :related_items

  after_save :set_related_items

  def set_related_items
    return unless related
    related_items.destroy_all

    related.zip(related_link, related_title).each do |item|
      r_id, r_link, r_title = item
      prefix, id = r_id.split('_')
      related_items.create(item_type: prefix, item_id: id)
      $redis.set r_id, {"link" => r_link, "title" => r_title}.to_json
    end
  end
end
