require 'open-uri'
class Event < ActiveRecord::Base
  attr_accessor :related, :related_link, :related_title

  has_many :related_items

  after_save :set_related_items

  def set_related_items
    return unless related
    related_items.destroy_all

    related.zip(related_link, related_title).each do |item|
      item_id, item_link, item_title = item
      prefix, id = item_id.split('_')
      related_items.create(item_type: prefix, item_id: id)

      $redis.set item_id, open(URI.encode("http://znaigorod.ru/api/single_#{prefix}?id=#{id}")).read
    end
  end
end

# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  when       :date
#  created_at :datetime
#  updated_at :datetime
#
