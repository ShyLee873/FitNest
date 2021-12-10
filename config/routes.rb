Rails.application.routes.draw do
  resources :posts
  resources :groups
  resources :users
  get '/posts/new/:user_id', to: 'posts#new', as: 'new_user_post'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
