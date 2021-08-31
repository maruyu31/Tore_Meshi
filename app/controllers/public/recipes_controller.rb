class Public::RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @recipe.ingredients.build
  end

  def index
    @categories = Category.all
    if params[:search].present?
      @recipes = Recipe.search(params[:search]).page(params[:page]).per(12)
      @recipes_count = Recipe.search(params[:search])
    elsif params[:category_search]
      @recipes = Recipe.where(category_id: params[:category_search]).page(params[:page]).per(12)
      @recipes_count = Recipe.where(category_id: params[:category_search])
    else
      @recipes = Recipe.all.order(created_at: :desc).page(params[:page]).per(12)
      @recipes_count = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
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
    @recipe.destroy
    redirect_to request.referer
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @recipes = Recipe.search(params[:search])
  end


  private

  def recipe_params
    params.require(:recipe).permit(
      :user_id,
      :category_id,
      :title,
      :introduction,
      :image,
      :serving,
      procedures_attributes: [:id, :body, :_destroy],
      ingredients_attributes: [:id, :name, :amount, :protein, :carbohydrate, :fat, :_destroy]
    )
  end
end
