Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root "base#index"
    resources :base
    resources :user
  end
  resources :users
  resources :songs
  resources :user
  resources :songs
  resources :albums
  root "home#index"
end
