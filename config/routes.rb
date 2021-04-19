Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'home/activity'
  get 'home/index'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  resources :greenhouses
  resources :floors do
    member do
      resources :environmental_settings
      # patch 'settings', to: 'environmental_settings#update', as: :update_settings
    end
  end
  resources :arduinos
  resources :sensors
  resources :users, only: %i[index edit show update]

  namespace :api do
    namespace :v1 do
      resources :greenhouses
      resources :floors
      resources :temperature_readings
      resources :humidity_readings
      resources :root_moisture_readings
      post 'login', to: 'sessions#login'
      delete 'logout', to: 'sessions#logout'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
