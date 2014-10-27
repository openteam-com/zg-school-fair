class Participant < ActiveRecord::Base
  validates_presence_of :full_name, :nomination

  has_attached_file :image, storage: :elvfs, elvfs_url: Settings['storage.url']

  extend Enumerize
  serialize :nomination, Array
  enumerize :nomination,
    in: [:vokal, :choreography, :poem, :minute_of_fame, :art],
    multiple: true
end

# == Schema Information
#
# Table name: participants
#
#  id                 :integer          not null, primary key
#  full_name          :string(255)
#  description        :text
#  nomination         :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :string(255)
#  image_url          :text
#  created_at         :datetime
#  updated_at         :datetime
#
