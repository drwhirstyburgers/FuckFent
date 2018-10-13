Rails.application.routes.draw do
  resources :pledges, only: [:index, :new, :create, :show, :destroy]

  resources :donations, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'welcome/about'

  get 'welcome/welcome'

  root 'welcome#welcome'
end
