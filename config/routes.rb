Rails.application.routes.draw do

  root to: 'homepages#index'

  resources :users, :homepages, :guilds

  resources :oauth, only: [:create, :new, :destroy]

  get '/login' => redirect('/auth/bnet')
  delete '/logout', to: 'oauth_sessions#destroy'
  get '/auth/bnet/callback', to: 'oauth_sessions#create'

end
