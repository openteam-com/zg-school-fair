class Participant < ActiveRecord::Base
  validates_presence_of :accept_terms
end
