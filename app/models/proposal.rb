class Proposal < ActiveRecord::Base

  validates_presence_of :title, :phone, :participant_type, :category, :contact

  after_save :send_email

  extend Enumerize
  enumerize :participant_type, in: [:full_time, :absentia]

  private
  def send_email
    ProposalMailer.delay(retry: false).send_anketa(self)
    #ProposalMailer.send_anketa(self).deliver!
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
