Rails.application.routes.draw do
  get 'likes/create'
  resources :users, only: [:index]
  resources :likes, only: [:create]
  resources :posts, only: [:index] do
    resources :comments, only: [:index, :create]
  end
end
