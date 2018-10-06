Rails.application.routes.draw do
  get 'donations/donations'

  get 'welcome/about'

  get 'welcome/welcome'

  root 'welcome#welcome'
end
