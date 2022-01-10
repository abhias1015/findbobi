Rails.application.routes.draw do
  resources :businesses
  ActiveAdmin.routes(self)
  
  resources :contact_requests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
