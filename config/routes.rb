# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'
  resources :users, only: [:new, :create, :destroy]
  resources :authentications, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'sign_up'
  get 'signin', to: 'authentications#new', as: 'sign_in'
  get 'logout', to: 'authentications#destroy', as: 'sign_out'
end
