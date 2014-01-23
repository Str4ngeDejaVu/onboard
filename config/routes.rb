Onboard::Application.routes.draw do

  get "sessions/new"
# hook up urls with rooms controller
resources :rooms 

# sign up our users to the site
resources :users

# login and logout of our site
# it's a singular resource because we can only do one session
resource :session 

# go to the homepage
root "rooms#index"

end
