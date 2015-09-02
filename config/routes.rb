Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resource :messages, only: [:new, :create, :show]

  root 'users#show'
end
