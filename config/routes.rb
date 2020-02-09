Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  
  resources :boards do
    resources :comments, only: [:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
