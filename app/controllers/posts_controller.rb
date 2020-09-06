class PostsController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def my_board
    @posts = current_user.posts.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)


    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
