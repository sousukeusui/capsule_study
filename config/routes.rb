Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  post 'users/create' =>'users#create'
  get '' => 'home#index'
  get 'new' => 'home#new' 
  get 'login' => 'home#login'
  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/edit/:id' => 'posts#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
