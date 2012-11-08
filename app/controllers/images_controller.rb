class ImagesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @image = Image.new(params[:image])
    @images.post = @post

    if @image.save
      flash[:notice] = "Your #{@images.title} has been posted."
      redirect_to @post
    else
      flash[:error] = "There was a problem posting your media. #{@images.errors.full_messages.join(". ")}."
      render 'posts/show'
    end
  end
end
