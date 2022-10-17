Rails.application.routes.draw do
  root 'home#index'

  namespace :oauth do
    resources :authorizations, only: [:new]
  end
end
