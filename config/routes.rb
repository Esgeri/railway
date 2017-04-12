Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :routes
    resources :tickets

    get 'welcome/index'

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
  end

  resource :search, only: [ :show, :create ]

  resources :tickets


  root 'searches#show'
end
