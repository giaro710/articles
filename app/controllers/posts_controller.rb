class PostsController < ApplicationController

  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def my_board
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    # raise
    if @post.update(post_params)
      redirect_to @post, notice: 'The post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # raise
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
