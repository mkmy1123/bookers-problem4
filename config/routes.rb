Rails.application.routes.draw do
	devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  root 'home#top'
  get 'home/about'

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
