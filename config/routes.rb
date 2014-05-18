Nickoverflow::Application.routes.draw do
  root :to => 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions
  resources :questions do
    resources :answers
  end
  resources :comments
  resources :answers
end
