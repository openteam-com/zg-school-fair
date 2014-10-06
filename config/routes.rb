Rails.application.routes.draw do
  namespace :manage do
    resources :events
  end
  resources :events, only: [:index, :show]

  root to: 'events#index'
end
