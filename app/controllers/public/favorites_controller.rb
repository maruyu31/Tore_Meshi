class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite = @recipe.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = @recipe.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
