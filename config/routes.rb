Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "registrations" }

  resources :users

  resources :albums do
    resources :songs
  end

  resources :playlists do
    member do
      get  "add_song", to: "playlist_songs#new"
      post "add_song", to: "playlist_songs#create"
    end
  end

  root "base#index"
end
