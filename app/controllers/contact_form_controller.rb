class ContactFormController < ApplicationController

  def create
    ContactMailer.delay.contact_form_email(contact_params)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Message sent. We\'ll get back to you shortly.' }
      format.js
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
