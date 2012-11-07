class PagesController < ApplicationController
  def new
	  @page = Page.new

	# #respond_to do |format|
	# format.html  # new.html.erb
	# format.json  { render :json => @page }
  end

  def create
  	@page = Page.new(params[:page])
	if @page.save
	  flash[:notice] = "Your page has been published."
	  redirect_to @page
	else
	  flash[:error] = "Your page couldn't be saved. #{@page.errors.full_messages.join}"
	  render :new
	end
  end
  
  def show
  	@page = Page.find(params[:id])
  end

  def index
    @pages = Page.all
  end

end

