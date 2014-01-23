class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	# if the user passes the parameters
  	if @user.save
  		# flash of content to tell the users
  		# they've successfully signed up
  		flash[:success] = "You've successfully signed up!"

  		# we want to keep track of who we've signed up as
  		# in rails we use a thing called a session
  		# this tracks us in the browser using a cookie
  		session[:user_id] = @user.id

  		# go back to home page
  		redirect_to root_path

  	else
  		render "new"
  	end
  end

  # make everything below private
  private
  def user_params
  	# shortcut for white listing form data
  	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
