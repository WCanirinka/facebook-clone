Rails.application.routes.draw do
  get 'commentlikes/new'
  get 'commentlikes/destroy'
  get '/posts/index', to: 'posts#index'
  get "/users" => "users#index"
  root 'welcome#index'

  get "myprofile" => "users#show", :as => :myprofile
  resources :posts, only: [:new, :create, :index, :show] do
    resources :comments
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
