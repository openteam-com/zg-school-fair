Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :manage do
    resources :proposals, only: [:index, :destroy]
    resources :events,    only: [:edit, :update]
    root to: redirect('/manage/events/school-fair-about/edit')
  end

  get 'about_fair', as: 'about_fair', to: 'events#index', defaults: { event_id: 'school-fair-about' }
  get 'fair_participants', as: 'fair_participants', to: 'events#index', defaults: { event_id: 'school-fair-participants' }

  resources :proposals, only: [:new, :create]

  root to: redirect('/about_fair')
end
