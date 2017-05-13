Rails.application.routes.draw do
  # Auth
  get 'auth/login', to: 'auth#login'
  get 'auth/logout', to: 'auth#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
