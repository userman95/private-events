Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/login'  => 'sessions#new'
  post '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/invite/:id' , to: 'users#invite'

  root 'users#new'
  resources :events, only: [:new, :create, :show, :index]
end
