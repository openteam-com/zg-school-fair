class EventMailer < ActionMailer::Base
  layout 'mailer'
  default from: "from@example.com"

  def event_mail
    mail(to: 'test@test.com', subject: 'Заявка на участие в конкурсе')
  end
end
