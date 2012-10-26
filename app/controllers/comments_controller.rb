class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Your comment has been posted."
      redirect_to @post
    else
      flash[:error] = "There was a problem posting your comment. #{@comment.errors.full_messages.join(". ")}."
      render 'posts/show'
    end
  end
end
