Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admins do
    root "base#index"
    resources :base
    resources :users
  end

  resources :users
  resources :songs
  resources :user
  resources :songs
  resources :albums
  root "home#index"
end
