Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 resources :users, only: [:show, :edit, :update]
 resources :titles, only: [:new, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
