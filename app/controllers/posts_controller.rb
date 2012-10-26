class PostsController < ApplicationController
  # index

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
  # edit
  # update
  # destroy
end
