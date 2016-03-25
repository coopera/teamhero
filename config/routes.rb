Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login' => 'sessions#new'
  get '/auth/github/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :organizations, only: [:index, :show] do
    resources :projects, only: :show
  end
end
