Rails.application.routes.draw do
  # get 'top/main'
  # get 'top/login'
  # get 'top/logout'
  resources :tweets, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :likes, only: [:create, :destroy]
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  root 'top#main'
  
  # post 'likes/create'
  # delete 'like/destroy'
  
end


 
  # get 'users/:id/edit' => 'users#edit'
  # post 'users/:id' => 'users#update'
  
  # get 'tweets/:id/edit' => 'tweets#edit'
  # post 'tweets/:id' => 'tweets#update'