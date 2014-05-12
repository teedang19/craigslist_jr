class PostsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :location, :price)
  end
end
