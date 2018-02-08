Rails.application.routes.draw do

  
  match 'user', to: 'users#create', via: [:post]
  match 'user/:id', to: 'users#show', via: [:get]
  match 'user', to: 'users#index', via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
