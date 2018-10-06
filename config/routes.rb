Rails.application.routes.draw do
  get 'welcome/about'

  get 'welcome/welcome'

  root 'welcome#welcome'
end
