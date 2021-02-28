Rails.application.routes.draw do
  mount Codelumi::Engine => '/codelumi'
  mount Warsawlease::Engine => '/warsawlease'
end
