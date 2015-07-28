require 'open-uri'

class Event < ActiveRecord::Base
  attr_accessor :related

  has_many :related_items, dependent: :destroy

  after_save :set_related_items

  extend FriendlyId
  friendly_id :title, use: :slugged
  def should_generate_new_friendly_id?
    return true if !self.slug?

    false
  end

  extend Enumerize
  enumerize :category, in: [:vokal, :choreography, :poem, :minute_of_fame, :art]

  def set_related_items
    return unless related
    related_items.destroy_all

    related.each do |item|
      prefix, id = item.split('_')
      related_items.create(item_type: prefix, item_id: id)

      $redis.set item, open(URI.encode("http://znaigorod.ru/api/single_#{prefix}?id=#{id}")).read
    end
  end
end

# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#
