class Public::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @recipe.ingredients.build
    @tags = Tag.all
  end

  def index
    @recipes = Recipe.all.order(created_at: :desc).page(params[:page]).per(12)
    @recipes_count = Recipe.all
    @tags = Tag.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :user_id,
      :tag_id,
      :title,
      :introduction,
      :image,
      :serving,
      :protein,
      :carbohydrate,
      :fat,
      procedures_attributes: [:id, :body, :_destroy],
      ingredients_attributes: [:id, :name, :amount, :_destroy]
    )
  end
end
