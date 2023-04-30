# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: :index do
    scope module: :posts do
      resources :comments, shallow: true
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
