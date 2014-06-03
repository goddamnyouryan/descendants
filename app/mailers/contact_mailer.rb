class ContactMailer < ActionMailer::Base

  def contact_form_email(params)
    @name = params[:name] || 'Unknown'
    @email = params[:email] || 'Unknown'
    @message = params[:message] || 'No Message'

    mail to: 'tasha@descendants.tv', from: @email, subject: 'descendants.tv contact form'
  end
end
