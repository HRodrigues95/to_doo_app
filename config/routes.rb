Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup' , to: 'users#new'
  get '/login'  , to: 'sessions#new'
  post '/login' , to: 'sessions#create'
  delete '/logout' , to: 'sessions#destroy'
  resources :users
  resources :dolists
  resources :todos, only: [:create, :update, :destroy] do
    resources :tags, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
