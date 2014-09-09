class FormMailer < ApplicationMailer
  def form(form, params)
    subject     "Submitted Form #{form.name}"
    from        "forms@forminator.heroku.com"
    recipients  form.recipients
    body        :form => form, :questions => params
  end
  
  def test(user)
    subject     "test email"
    from        user.email
    recipients  user.email
    body        :user => user
  end
end