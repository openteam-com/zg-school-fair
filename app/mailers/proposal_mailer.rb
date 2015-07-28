class ProposalMailer < MandrillMailer
  default from: 'Школьная Ярмарка от ЗнайГорода <no-reply@znaigorod.ru>'
  layout 'mailer'

  def send_anketa(anketa)
    @proposal = anketa
    mail(to: 'bvm@openteam.ru', subject: 'Новая анкета для Школьной Ярмарки') if Rails.env.development?
    mail(to: 'office@znaigorod.ru', subject: 'Новая анкета для Школьной Ярмарки') if Rails.env.production?
  end
end
