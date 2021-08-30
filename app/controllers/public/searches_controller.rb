class Public::SearchesController < ApplicationController
  def search
    @categories = Category.all
    if params[:model] == "recipes"
      @recipes = Recipe.search(params[:model], params[:keyword]).page(params[:page]).per(8)
      @products_count = Product.search(params[:model], params[:keyword])
      render "public/products/index"
    else
      @products = Product.search(params[:model], params[:keyword]).page(params[:page]).per(8)
      @products_count = Product.search(params[:model], params[:keyword])
      render "public/products/index"
    end
  end
end
