Rails.application.routes.draw do
  resources :donations, only: [:new, :create]

  get 'welcome/about'

  get 'welcome/welcome'

  root 'welcome#welcome'
end
