Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/new'
  get 'questions/edit/:id' =>'questions#edit'
  patch 'questions/edit/:id' => 'questions#update'
  get 'questions/answer'
  post 'questions/result' => 'questions#result'
  get 'questions/result' => 'posts#index'
  get 'questions/create' => 'questions#create'
  post 'questions/create' => 'questions#create'
  get 'questions/delete/:id' => 'questions#delete'
  post 'questions/answer_check' => 'questions#answer_check'
  get 'users/new'
  get 'users/create'
  get 'users/show/:id' => 'users#show'
  get 'users/edit/:id' =>'users#edit'
  patch 'users/edit/:id' => 'users#update'
  get 'users/delete/:id' => 'users#delete'
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
  get 'logout' => 'sessions#destroy'
  resources :contacts,only: [:new,:create]
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  get 'posts/questions/new' => 'post_questions#new'
  post 'posts/questions/new' =>'post_questions#create'
  get 'posts/questions/list' =>'post_questions#list'
  get 'posts/questions/start/:id' => 'post_questions#start'
  get 'posts/questions/answer/:id' => 'post_questions#answer'
  post 'posts/questions/answer/:id' => 'post_questions#result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
