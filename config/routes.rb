Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  get 'auth', to: 'user#auth', as: 'auth'

  get 'gw_message', to: 'router#message', as: 'message'
  get 'ping', to: 'router#ping', as: 'ping'
  get 'portal', to: 'router#portal', as: 'portal'
end
