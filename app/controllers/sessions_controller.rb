class SessionsController < ApplicationController

  # sessions are the way the browser tracks me
  # we want to manage them in our app
  # sessions controller deals with this stuff

  def new
    # login form
  end

  def create
    # do the login

    # i want to find the username and password typed in
    @username = params[:session][:username]
    @password = params[:session][:password]
    # then i want to see if there's a user with that username
    @user = User.find_by_username(@username)
    # if there is, check their password aswell
    if @user.present? and @user.authenticate(@password)
    # if it matches, give them a session
    session[:user_id] = @user.id
    flash[:success] = "You're logged in"
    redirect_to root_path
    # if not, show the new page
    else
    render "new"
    end
  end

  def destroy
    #aka logout
    reset_session
    flash[:success] = "You've logged out"
    redirect_to root_path
  end
end
