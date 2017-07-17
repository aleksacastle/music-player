Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :admin do
    resources :user
  end
  resources :users

  resources :albums do
    resources :songs
  end

  root "home#index"
end
