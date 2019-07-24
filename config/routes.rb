Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    post "like", to: "likes#create"
    delete "like", to: "likes#destroy"
  end
  resources :users, only: [:show]
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
