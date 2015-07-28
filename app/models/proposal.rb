class Proposal < ActiveRecord::Base
  extend Enumerize
  attr_accessor :accept_terms

  #after_validation :check_terms_accepted

  validates_presence_of :title, :phone, :participant_type, :category, :contact

  enumerize :participant_type, in: [:full_time, :absentia]

  def check_terms_accepted
    errors[:accept_terms] << 'Необходимо принять пользовательское соглашение' unless accept_terms == '1'
    true
  end
end

# == Schema Information
#
# Table name: proposals
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  category         :string(255)
#  phone            :string(255)
#  participant_type :string(255)
#  space            :integer
#  created_at       :datetime
#  updated_at       :datetime
#  contact          :string(255)
#
