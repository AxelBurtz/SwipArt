Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :artworks, only: %i[like dislike]
  resources :artworks, only: %i[create new edit update] do
    member do
      post 'like'
      post 'dislike'
    end
  end

      post "user_exhibitions/saved", to: "user_exhibitions#saved"
      post "user_exhibitions/discard", to: "user_exhibitions#discard"
    # post "user_exhibition/saved", to: "user_exhibitions#saved"
    # post "user_exhibition/discard", to: "user_exhibitions#discard"

  get 'dashboard', to: 'pages#dashboard'
end
