Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :posts, only: [:index]
end
