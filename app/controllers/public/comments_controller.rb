class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    Comment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    @recipe = Recipe.find(params[:recipe_id])
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
