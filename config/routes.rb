Rails.application.routes.draw do
  get 'posts' => 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/edit/:id' => 'posts#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
