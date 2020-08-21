Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup' , to: 'users#new'
  get '/login'  , to: 'sessions#new'
  post '/login' , to: 'sessions#create'
  delete '/logout' , to: 'sessions#destroy'

  # Since dolists belongs_to user, you should've set routes
  # for the former under the latter.
  # And since todos belongs_to dolists, the same would apply
  resources :users do
    resources :dolists do
      resources :todos, only: [:create, :update, :destroy] do
        resources :tags, only: :create
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
