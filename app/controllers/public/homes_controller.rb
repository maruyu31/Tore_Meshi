class Public::HomesController < ApplicationController
  def top
    @contact = Contact.new
  end

  def about
  end
end
