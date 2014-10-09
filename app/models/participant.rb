class Participant < ActiveRecord::Base
  extend Enumerize
  attr_accessor :accept_terms

  after_validation :check_terms_accepted

  validates_presence_of :performer, :nomination, :age, :phone, :email, :performance_name, :music

  serialize :nomination, Array
  enumerize :nomination,
    in: [:vokal, :choreography,:poem, :minute_of_fame, :art],
    multiple: true

  serialize :auditory, Array
  enumerize :auditory,
    in: [:schoolboys, :young_workers, :students, :older_people],
    multiple: true

  def check_terms_accepted
    errors[:accept_terms] << 'Необходимо принять пользовательское соглашение' unless accept_terms == '1'
    true
  end
end

# == Schema Information
#
# Table name: participants
#
#  id               :integer          not null, primary key
#  performer        :string(255)
#  nomination       :string(255)
#  auditory         :string(255)
#  age              :integer
#  address          :string(255)
#  phone            :string(255)
#  email            :string(255)
#  performance_name :string(255)
#  music            :string(255)
#  accept_terms     :boolean
#  created_at       :datetime
#  updated_at       :datetime
#
