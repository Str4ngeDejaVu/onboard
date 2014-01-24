class RoomsController < ApplicationController

  # before quite a few of the actions below
  # make sure we're logged in
  before_action :make_sure_logged_in, except: [:index, :show]

  def index
  	@rooms = Room.near("London")

  end

  def show
    @room = Room.find(params[:id])
  end

  def new
  	# the variable @room goes to the view
  	# Room.new comes from the model
  	@room = current_user.rooms.new

  end

  # this is where the form data from the new.html.erb view goes
  def create
  	@room = current_user.rooms.new(room_params)

  	# if the room passes the parameters
  	if @room.save
  		# let's add a flash of content to tell the user
  		# they've succesfully added a room
  		flash[:success] = "You've added your room"

  		# go back to the home page
  		redirect_to root_path
  	else
  		render "new"

  	end
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])
  	# if updates pass room_params
  	if @room.update(room_params)
  	# show the user it's been successful
		flash[:success] = "You've updated this room"

		# redirect back to the room
		redirect_to room_path(@room)
	   else
		    # otherwise reload the edit page
		    render "edit"

	   end
  end

  def destroy   
    @room =current_user.rooms.find(params[:id])
    @room.destroy
    # show the user it's been successful 
    flash[:success] = "You've deleted this story"
    # redirect back to home page
    redirect_to root_path

  end

  # makes everything below private
  private
  # shortcut for white listing
  def room_params
  	params.require(:room).permit(
  		:title, :address, :description, :max_guests, :bedrooms, :price)
  end
end
