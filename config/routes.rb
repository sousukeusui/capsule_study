Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  post 'users/create' =>'users#create'
  post 'users/login' => 'users#login'
  get '' => 'home#index'
  get 'new' => 'home#new' 
  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/edit/:id' => 'posts#edit'
  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
