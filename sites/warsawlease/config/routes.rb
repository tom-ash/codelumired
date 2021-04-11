# frozen_string_literal: true

Warsawlease::Engine.routes.draw do
  mount Warsawlease::Api::Base => '/'

  get 'route_data', to: 'route_data#show'

  post '/pages', to: 'pages#create'
  put '/pages', to: 'pages#edit'

  post '/pictures/create/temporary', to: 'pictures#create_temporary'
  post '/pictures/create/announcement/:id', to: 'pictures#create_for_announcement'
  get '/pictures', to: 'pictures#show'
end
