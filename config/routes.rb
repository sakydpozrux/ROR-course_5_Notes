Rails.application.routes.draw do
  devise_for :users

  resources :notes

  #root to: 'home#index'
  get 'static_pages/home'
  get 'static_pages/help'

  root to: 'static_pages#home'
end
