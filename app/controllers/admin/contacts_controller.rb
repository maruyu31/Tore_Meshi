class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contacts = Contact.all.page(params[:page]).per(20)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to request.referer
  end

  private

  def contact_params
    params.require(:contact).permit(:status)
  end
end
