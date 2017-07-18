Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users
  resources :songs
  resources :user
  resources :songs
  resources :albums
  root "home#index"
end
