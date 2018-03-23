Rails.application.routes.draw do
  get 'home/index'

  post 'login', to: 'sessions#new', as: 'new_session'
  get 'logout', to: 'sessions#destroy', as: 'destroy_session'
  post 'verify_mfa', to: 'sessions#verify', as: 'verify_mfa'

  get 'dashboard', to: 'dashboard#index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
