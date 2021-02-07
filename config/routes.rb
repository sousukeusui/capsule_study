Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show/:id' => 'users#show'
  get 'users/edit/:id' =>'users#edit'
  patch 'users/edit/:id' => 'users#update'
  post 'users/create' =>'users#create'
  post 'users/login' => 'users#login'
  get '' => 'home#index'
  get 'new' => 'home#new' 
  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new'
  get 'posts/show'
  get 'posts/delete/:id' => 'posts#delete'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/edit/:id' => 'posts#edit'
  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
