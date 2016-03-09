Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
