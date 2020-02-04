Rails.application.routes.draw do
  get 'commentlikes/new'
  get 'commentlikes/destroy'
  get '/posts/index', to: 'posts#index'
  #get "users/:id" => "users#show"
  root 'welcome#index'
  post 'friendships/accept/:id' => 'friendships#accept', as: 'accept_friend'
  post 'friendships/decline/:id' => 'friendships#decline', as: 'decline_friend'
  post 'friends/cancel/:id' => 'friendships#cancel', as: 'cancel_friend'
  post 'friends/delete/:id' => 'friendships#delete', as: 'delete_friend'

  resources :posts, only: [:new, :create, :index, :show] do
    resources :comments
  end
  resources :friendships
  resources :postlikes
  resources :commentlikes
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users" => "users#index"
  get "users/:id" => "users#show", as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
