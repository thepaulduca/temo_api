Rails.application.routes.draw do
    resources :users, only: [:new, :create, :show]
    resources :conversations, only: [:create, :show]
    resources :messages, only: [:create]
    post 'users/login', to: 'users#login'
    post 'users/conversations', to: 'users#conversations'
    post 'users/show', to: 'users#show'
end
