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
