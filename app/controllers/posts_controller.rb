class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Your post has been published."
      redirect_to @post
    else
      flash[:error] = "Your post couldn't be saved. #{@post.errors.full_messages.join}"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages.join
      render :edit
    end
  end
end
