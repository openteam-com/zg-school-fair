Rails.application.routes.draw do
  namespace :manage do
    resources :events
  end

  resources :events, only: [:index, :show] do
    post 'send_event', as: :send,        on: :collection
  end

  get 'about',            as: :about, to: 'static_pages#about'
  get 'show_conditions',  as: :show_conditions, to: 'static_pages#show_conditions'

  resources :participants, only: [:new, :create]

  root to: 'static_pages#about'
end
