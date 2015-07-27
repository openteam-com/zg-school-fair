class Proposal < ActiveRecord::Base
  extend Enumerize
  attr_accessor :accept_terms

  after_validation :check_terms_accepted

  validates_presence_of :title, :phone, :format, :category, :accept_terms

  #enumerize :format, in: [:full_time, :absentia]

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
#  performer        :string(255)
#  nomination       :text
#  auditory         :text
#  age              :integer
#  address          :string(255)
#  phone            :string(255)
#  email            :string(255)
#  performance_name :string(255)
#  music            :integer
#  accept_terms     :boolean
#  created_at       :datetime
#  updated_at       :datetime
#
