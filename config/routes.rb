Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'
  devise_for :users
  
  resources :boards do
    resources :comments, only: [:create, :destroy]
  end
  
  get 'search', to: 'homes#search', via: [:get, :post]

end
