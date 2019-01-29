Rails.application.routes.draw do
  get 'home/index'

  post 'login', to: 'sessions#new', as: 'new_session'
  get 'logout', to: 'sessions#destroy', as: 'destroy_session'
  post 'verify_mfa', to: 'sessions#verify', as: 'verify_mfa'
  post 'forgot_password', to: 'sessions#forgot_password', as: 'forgot_password'
  post 'reset_password', to: 'sessions#reset_password', as: 'reset_password'

  get 'dashboard', to: 'dashboard#index'

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch 'users/:id', to: 'users#update', as: 'update_user'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
