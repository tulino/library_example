Rails.application.routes.draw do
  resources :deposits
  resources :users
  resources :books
  devise_for :admins

  resources :categories

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
