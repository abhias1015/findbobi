Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :contact_requests do
    collection do
      get :accepted
    end
  end

  resources :businesses do
    collection do
      get :home, :accepted
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "businesses#home"
end
