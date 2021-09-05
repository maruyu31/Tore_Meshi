class Public::HomesController < ApplicationController
  def top
    @contact = Contact.new
    @new_recipes = Recipe.order(created_at: :desc).limit(3)
    @categories = Category.all
    if Favorite.exists?(created_at: Time.now.all_month)
      @recipe_ranking = Recipe.joins(:favorites).where(favorites: {created_at: Time.now.all_month}).group("id").order("count(favorites.recipe_id) DESC").limit(3)
    else
      @recipe_ranking = Recipe.joins(:favorites).where(favorites: {created_at: Time.now.all_year}).group("id").order("count(favorites.recipe_id) DESC").limit(3)
    end
  end

  def about
  end
end
