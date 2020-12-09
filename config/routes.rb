Rails.application.routes.draw do
  devise_for :users
  root to: "trainings#index"
  resources :trainings, only: [:new, :create, :show, :edit, :update, :destroy]
end
