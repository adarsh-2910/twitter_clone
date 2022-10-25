Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :twits
  resources :users do
    member do
    get 'new_profile'
    put 'update_profile'
    end
  end  

  root "twits#index"
  
  # get "twits/form"
end
