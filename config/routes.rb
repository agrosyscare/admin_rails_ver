Rails.application.routes.draw do
  resources :floors
  root 'static_pages#landing_page'
  devise_for :users
  resources :greenhouses
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
