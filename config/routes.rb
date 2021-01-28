Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "trainings#index"

  resources :trainings, only: [:new, :create, :show, :edit, :update, :destroy ] do
    resources :comments, only: :create 
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
