class PostsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @post.update_attributes(post_params)

    redirect_to category_post_path(@category, @post)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    flash[:success] = "Post #{@post.title} has been VAPORIZED!"
    @post.destroy

    redirect_to category_posts_path(@category)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :location, :price)
  end
end
