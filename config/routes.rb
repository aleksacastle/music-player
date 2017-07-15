Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :user
  end
  resources :users
  resources :songs
  resources :user
  resources :songs
  resources :albums
  root "home#index"
end
