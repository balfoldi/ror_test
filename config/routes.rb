Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :likes, only: [:create]
  resources :posts, only: [:index] do
    resources :comments, only: [:index, :create]
  end
end
