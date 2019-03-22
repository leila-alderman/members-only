Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'sessions#new'
  resources :sessions, only: [:new, :create]
  delete '/signout', to: 'sessions#destroy'
end
