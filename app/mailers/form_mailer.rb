class FormMailer < ApplicationMailer
  def form(form, params)
    subject     "Submitted Form #{form.name}"
    from        "Forminator via <#{User.find(form.creator_id).email}>"
    recipients  form.recipients
    body        :form => form, :questions => params
  end
end