class Participant < ActiveRecord::Base
  attr_accessor :accept_terms

  validates_presence_of :performer, :nomination, :age, :phone, :email, :performance_name, :music

  enumerize :nomination,
    in: [:a,:b,:c,:d,:e],
    multiple: true

  enumerize :auditory,
    in: [:schoolboys, :young_workers, :students, :older_people],
    multiple: true
end
