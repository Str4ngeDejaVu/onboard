Onboard::Application.routes.draw do

# hook up urls with rooms controller
resources :rooms 

# go to the homepage
root "rooms#index"

end
