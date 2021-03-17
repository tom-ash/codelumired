# frozen_string_literal: true

Warsawlease::Engine.routes.draw do
  mount Warsawlease::Api::Base => '/'

  # TODO: MOVE TO API
  resources :announcements
  get 'route_data', to: 'route_data#show'
  post '/pages', to: 'pages#create'
  put '/pages', to: 'pages#edit'
  get '/announcements/:id/edit', to: 'announcements#edit'
  get '/announcement/phone/:id', to: 'users#phone'
  put '/announcements/view/:id', to: 'announcements#view'
  put '/announcements/extend/:id', to: 'announcements#extend_active'
  put '/announcements/trigger_visible/:id', to: 'announcements#trigger_visible'
  get '/calculate_rent_amounts', to: 'announcements#calculate_rent_amounts'
  post '/pictures/create/temporary', to: 'pictures#create_temporary'
  post '/pictures/create/announcement/:id', to: 'pictures#create_for_announcement'
  get '/pictures', to: 'pictures#show'
end
