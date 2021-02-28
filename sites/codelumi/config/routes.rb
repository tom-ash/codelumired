Codelumi::Engine.routes.draw do
  get 'route_data', to: 'route_data#show'
  post '/pages', to: 'pages#create'
  put '/pages', to: 'pages#edit'
end
