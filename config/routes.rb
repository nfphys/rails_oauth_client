Rails.application.routes.draw do
  root 'home#index'

  namespace :oauth do
    resources :authorizations, only: [:new]
    get '/callback', to: 'callbacks#index'
  end
end
