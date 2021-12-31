Rails.application.routes.draw do
  mount SoundofIt::Engine => '/soundof_it'
  mount Warsawlease::Engine => '/warsawlease'
end
