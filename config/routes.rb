Rails.application.routes.draw do
  devise_for :users

  resources :notes

  root to: 'home#index'
end
