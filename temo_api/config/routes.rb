Rails.application.routes.draw do
    resources :users, only: [:create, :show]
    resources :conversations, only: [:create, :show]
    resources :messages, only: [:create]
end
