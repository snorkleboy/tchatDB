Rails.application.routes.draw do
  get 'session/login'

  get 'session/logout'

  match 'user', to: 'users#create', via: [:post]
  match 'user/:id', to: 'users#show', via: [:get]
  match 'user', to: 'users#index', via: [:get]
  match 'isuser', to: 'users#isuser', via: [:post]

  match 'login', to: 'session#login', via: [:post]
  match 'logout', to: 'session#logout', via: [:get]
  match 'tokencheck', to: 'session#tokencheck', via: [:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
