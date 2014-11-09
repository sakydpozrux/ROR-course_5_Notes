Rails.application.routes.draw do
  devise_for :users

  resources :notes

  #root to: 'home#index'
  root to: 'notes#index'
end
