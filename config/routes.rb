Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :admin do
    resources :user
  end
  resources :users
  resources :songs
  resources :albums
  root "home#index"
end
