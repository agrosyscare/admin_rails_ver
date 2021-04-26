Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'home/activity'
  get 'home/index'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'greenhouses_chart', to: 'home#charts'

  namespace 'charts' do
    get 'filter'
    get 'floors_second'
  end

  resources :greenhouses
  resources :environmental_settings, only: %i[index update]
  resources :floors
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
      get 'logout', to: 'sessions#logout'
      post 'fcm/token', to: 'firebase#update'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
