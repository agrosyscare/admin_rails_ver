Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'home', to: 'home#index'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  namespace 'charts' do
    get 'temperatures'
    get 'humidities'
    get 'root_moistures'
  end

  concern :with_datatable do
    post 'datatable', on: :collection
  end

  resources :greenhouses, concerns: [:with_datatable] do
    get :rollback
    member do
      get :charts
    end
  end

  resources :floors, concerns: [:with_datatable] do
    get :rollback
  end

  resources :arduinos, concerns: [:with_datatable] do
    get :rollback
  end

  resources :users, concerns: [:with_datatable] do
    get :rollback
  end

  resources :sensors, except: %i[index show]
  resources :environmental_settings, only: %i[index]

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
