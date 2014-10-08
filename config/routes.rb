Rails.application.routes.draw do
  namespace :manage do
    root to: 'events#index'
    resources :events
  end

  resources :events, only: [:index, :show] do
    post 'send_event', as: :send,        on: :collection
  end

  get 'about',       as: :about, to: 'events#about'
  get 'show_conditions',  as: :show_conditions, to: 'events#show_conditions'
  get 'send_request',     as: :send_request, to: 'events#send_request'

  resources :participants, only: [:new, :create]

  root to: 'events#index'
end
