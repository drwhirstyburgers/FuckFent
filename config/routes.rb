Rails.application.routes.draw do
  resources :pledges

  resources :admins

  resources :donations, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'welcome/about'

  get 'welcome/welcome'

  root 'welcome#welcome'
end
