class PostsController < ApplicationController

  before_filter :lookup_post

  def index
    @posts = Post.scoped
  end

  def show
    @comment = Comment.new
  end

  def create
    @post.author = current_user
    if @post.save
      if @post.published?
        flash[:notice] = "Your post has been published."
      else
        flash[:notice] = "Your post has been scheduled. It will be published on #{@post.publish_date}"
      end
      redirect_to @post
    else
      flash[:error] = "Your post couldn't be saved. #{@post.errors.full_messages.join}"
      render :new
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages.join
      render :edit
    end
  end

  protected

  def lookup_post
    if params[:id]
      @post = Post.find(params[:id])
    else
      @post = Post.new(params[:post])
    end
  end
end
