Rails.application.routes.draw do
  devise_for :users
  resources :twits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "twits#index"
  # get "twits/form"
end
