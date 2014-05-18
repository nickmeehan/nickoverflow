Nickoverflow::Application.routes.draw do
  root :to => 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions
  resources :comments
  resources :answers
end
