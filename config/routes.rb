Rails.application.routes.draw do
  devise_for :users
  # root "messages#index"
  
  # root = localhost:3000
  # グループコントローラのindexアクション
  root 'groups#index'
  resources :users, only: [:index,:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
