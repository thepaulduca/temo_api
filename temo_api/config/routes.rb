Rails.application.routes.draw do
    resources :users, only: [:new, :create, :show]
    resources :conversations, only: [:create, :show]
    resources :messages, only: [:create]

    post 'users/show',to: 'users#show'
end
