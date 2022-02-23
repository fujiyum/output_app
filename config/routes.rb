Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: %i[show edit update] do
    get :search, on: :collection
  end
  resources :titles, shallow: true do
    collection do
      get :search
    end
    resource :nices, only: %i[create destroy]
  end
  resources :inputs, only: %i[new create index show edit update] do
    resources :comments, only: %i[create destroy]
  end
  resources :outputs, only: %i[new create edit update destroy]
  resources :notes, only: %i[new create index edit update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
