class PostsController < ApplicationController
  # index

  def show
    @post = Post.find(params[:id])#I'm gussing this finds posts by the parameter id? show.@post????
  end

  def new
    @post = Post.new#here's a new post?
  end

  def create #creates a new post
    @post = Post.new(params[:post])
    @post.save
    flash[:notice] = "Your post has been published." #flash confuses me
    redirect_to @post
  end
  # edit
  # update
  # destroy
end
