class PostsController < ApplicationController

  def index
    @posts = Post.all

  end


  def create

    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, :notice => "Your post was saved"
    else
      render "new"
    end

  end

  def new
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:title, :description, :comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, :notice => "Your post has been update"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"

  end

end
