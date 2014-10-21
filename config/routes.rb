Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'cats#index'

  resources :cats, only: [:index, :show, :edit, :update, :new, :create]

  post 'session/login' => 'authentication#login', as: :login
  post 'session/logout' => 'authentication#destroy', as: :logout
  get 'session/login' => 'authentication#new', as: :new_login
end
