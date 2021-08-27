class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @recipes = Recipe.all.page(params[:page]).per(20)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_recipes_path
  end
end
