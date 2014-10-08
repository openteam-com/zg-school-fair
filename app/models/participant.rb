class Participant < ActiveRecord::Base
  extend Enumerize
  attr_accessor :accept_terms

  validates_presence_of :performer, :nomination, :age, :phone, :email, :performance_name, :music

  enumerize :nomination,
    in: [:a,:b,:c,:d,:e],
    multiple: true

  enumerize :auditory,
    in: [:schoolboys, :young_workers, :students, :older_people],
    multiple: true
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
