Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  get 'home/activity'
  get 'home/index'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  
  resources :greenhouses
  resources :floors
  resources :arduinos
  resources :sensors
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
