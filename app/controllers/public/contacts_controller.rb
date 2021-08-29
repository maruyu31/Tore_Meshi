class Public::ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to request.referer
    else
      render :top
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:title, :body, :status)
  end
end
