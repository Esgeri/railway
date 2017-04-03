Rails.application.routes.draw do
  resources :trains
  resources :carriages
  resources :routes
  resources :railway_stations

  get 'welcome/index'

  root 'welcome#index'
end
