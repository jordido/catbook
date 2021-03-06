Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'cats#index'

  resources :cats, only: [:index, :show, :edit, :update, :new, :create]

  post 'session/login' => 'authentication#login', as: :login
  get 'session/login' => 'authentication#new', as: :new_login
  get 'session/logout' => 'authentication#new', as: :logout
  get 'cat_mailer/welcome' =>'cat_mailer#welcome', as: :welcome

  namespace :api do
  	namespace :v1 do
  		resources :cats, only: [:index, :show]
  	end
  end

end
