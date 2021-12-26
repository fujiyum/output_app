Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 resources :users, only: [:show, :edit, :update]
 resources :titles, only: [:new, :create, :index]
 resources :inputs, only: [:new, :create, :index, :show, :edit, :update] do
  resources :comments, only: [:create, :destroy]
 end
 resources :outputs, only: [:new, :create, :index, :edit, :update]
 resources :notes, only: [:new, :create, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
