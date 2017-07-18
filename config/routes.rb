Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins
  devise_for :users, controllers: { registrations: "registrations" }

<<<<<<< HEAD
=======
  namespace :admin do
    resources :user
  end

>>>>>>> master
  resources :users

  resources :albums do
    resources :songs
  end

  resources :playlists do
    member do
      post "add_song"
    end
  end

  resources :songs
  resources :albums

  # resources :playlists do
  #   resources :songs
  # end
  root "base#index"
end
