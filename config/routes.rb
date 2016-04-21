Rails.application.routes.draw do
  devise_for :users

  root to: 'homepages#index'

  resources :users, :homepages, :guilds

  get '/login' => redirect('/auth/bnet')
  get '/logout', to: 'oauth_sessions#destroy'
    # session[:user_id] = nil
    # session[:user_info] = nil
    # redirect OmniAuth.config.full_host
  get '/auth/bnet/callback', to: 'oauth_sessions#create'
  # auth = request.env["omniauth.auth"]
  # session[:user_id] = auth["uid"]
  # session[:user_info] = auth["info"]
  # redirect OmniAuth.config.full_host


  # get '/auth/failure'
  # erb "<h1>Authentication Failed:</h1><h3>message:#{params[:message]}<h3> <pre>#{params}</pre>"

  # get '/auth/bnet/deauthorized'
  # erb "#{params[:provider]} has deauthorized this app."

end
