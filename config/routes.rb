# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: :index do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[create destroy]
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
