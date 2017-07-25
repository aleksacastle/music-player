Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # devise_scope :user do
  #   delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  # end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

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

  # resources :songs
  # resources :albums

  # resources :playlists do
  #   resources :songs
  # end
  root "base#index"
end
