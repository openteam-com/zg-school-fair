class EventMailer < ActionMailer::Base
  default from: Settings['mail.from']

  def event_mail(participant)
    @participant = participant
    mail(to: Settings['mail.to'], subject: 'Заявка на участие в конкурсе')
  end
end
