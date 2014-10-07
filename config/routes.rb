Rails.application.routes.draw do
  namespace :manage do
    root to: 'events#index'
    resources :events
  end

  resources :events, only: [:index, :show] do
    post 'send_event', as: :send, on: :collection
  end

  resources :participants, only: [:new, :create]

  root to: 'events#index'
end
