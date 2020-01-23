Rails.application.routes.draw do
  get '/posts/index', to: 'posts#index'

  root 'welcome#index'

  get "myprofile" => "users#show", :as => :myprofile
  resources :posts, only: [:new, :create, :index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
