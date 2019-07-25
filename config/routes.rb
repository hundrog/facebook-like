Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:index, :new, :create, :destroy]
    post "like", to: "likes#create"
    delete "like", to: "likes#destroy"
    # get "comment", to: "comments#new"
    # post "comment", to: "comments#create"
    # delete "comment", to: "comments#destroy"
  end
  resources :users, only: [:show]
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
