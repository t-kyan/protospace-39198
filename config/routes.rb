Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: :show
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]



  resources :prototypes do
    resources :comments, only: :create
  end

 
end
