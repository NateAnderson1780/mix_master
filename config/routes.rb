Rails.application.routes.draw do
  root to: "artists#index"
  
  resources :artists do
    resources :songs, only: [:new, :create]
  end
  
  resources :songs, only: [:show, :index]
  resources :playlists
  
  get '/auth/spotify/callback', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'
end
