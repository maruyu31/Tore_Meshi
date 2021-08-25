class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    redirect_to request.referer
  end
  
  private
  
  def content_params
    params.require(:content).permit(:status)
  end
end
