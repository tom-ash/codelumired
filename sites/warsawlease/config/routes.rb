# frozen_string_literal: true

Warsawlease::Engine.routes.draw do
  mount Warsawlease::Api::Base => '/'

  post '/pages', to: 'pages#create'
  put '/pages', to: 'pages#edit'

  get 'route_data', to: 'route_data#show'
end
