Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  resources :posts do
<<<<<<< HEAD
    resources :likes
    resources :comments, module: :posts
=======
    resources :comments
>>>>>>> b6b95a9b72d61c5f3b9b416492108caf268c8706
  end
  resources :groups
  resources :users
  get '/posts/new/:user_id', to: 'posts#new', as: 'new_user_post'

  
  delete '/users/:id/memberships/:group_id', to: 'users#delete_membership', as: 'delete_membership'
  delete '/groups/:id/memberships/:user_id', to: 'groups#delete_user_membership', as: 'delete_user_membership'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
