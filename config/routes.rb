Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :songs
  resources :user
  resources :songs
  resources :albums
  root "home#index"
end
