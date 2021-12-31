Rails.application.routes.draw do
  resources :notes
  resources :users

  # root 'users#index'
  root 'application#index'
  get 'register', to: 'users#new'

  get 'signin', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
