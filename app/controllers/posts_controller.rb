class PostsController < ApplicationController
  # index

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save
    flash[:notice] = "Your post has been published."
    redirect_to @post
  end
  # edit
  # update
  # destroy
end
