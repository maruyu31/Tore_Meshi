class Public::HomesController < ApplicationController
  def top
    @contact = Contact.new
    @new_recipes = Recipe.order(created_at: :desc).limit(4)
    @tags = Tag.all
  end

  def about
  end
end
