class Public::ContactsController < ApplicationController
  before_action :check_recaptcha_verification, only: :create

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :body, :status)
  end

  def check_recaptcha_verification
    unless verify_recaptcha(message: 'reCAPTCHAにチェックを入れてください')
      redirect_to request.referer
    end
  end
end
