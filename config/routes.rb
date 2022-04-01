# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :transactions, only: %i[new create index]

  root 'dashboard#index'

  get 'subscriptions_tier/index'
  get 'loyalty_points/index'
  get '/rewards' => 'users_rewards#index', as: 'rewards'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
