class EventMailer < ActionMailer::Base
  default from: "from@example.com"

  def event_mail(participant)
    @participant = participant
    mail(to: 'test@test.com', subject: 'Заявка на участие в конкурсе')
  end
end
