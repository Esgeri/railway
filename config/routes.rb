Rails.application.routes.draw do
  resources :trains
  resources :carriages
  resources :routes
  resources :railway_stations do
    patch :update_position, on: :member
  end

  get 'welcome/index'

  root 'welcome#index'
end
