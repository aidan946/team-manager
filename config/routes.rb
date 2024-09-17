# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :user, path: '', path_names: { sign_in: '', sign_out: 'logout', sign_up: 'register' },
                    controllers: { sessions: 'login', registrations: 'registration' }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'login#index'
  post 'login' => 'login#login'
  get 'reset_password' => 'login#reset_password'
  post 'reset_email' => 'login#reset_email'
  get 'logout' => 'login#logout'

  get 'register' => 'login#register'
  post 'create_account' => 'login#create_account'

  get 'dashboard' => 'dashboard#index'

  get 'settings' => 'settings#show'

  resources :teams

  resources :posts

  get 'all_teams' => 'teams#all_teams'

  resources :users
end
