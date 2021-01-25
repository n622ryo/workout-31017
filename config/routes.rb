Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "trainings#index"
  resources :trainings, only: [:new, :create, :show, :edit, :update, :destroy ] do
    resources :comments, only: :create 
    resource :favorites, only: [:create, :destroy]
  end
    resources :users, only: [:show, :edit, :update]
end
