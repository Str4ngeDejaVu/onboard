Onboard::Application.routes.draw do

# hook up urls with rooms controller
resources :rooms 

# sign up our users to the site
resources :users

# go to the homepage
root "rooms#index"

end
