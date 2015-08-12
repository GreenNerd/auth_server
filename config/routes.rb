Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  get 'auth', to: 'user#auth', as: 'auth'
end
