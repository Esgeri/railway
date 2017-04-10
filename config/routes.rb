Rails.application.routes.draw do
  devise_for :users

  resources :trains do
    resources :carriages, shallow: true
  end

  resources :routes

  resource :search, only: [ :show, :create ]

  resources :tickets, only: [ :show, :create, :new ]

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end

  get 'welcome/index'

  root 'welcome#index'
end
