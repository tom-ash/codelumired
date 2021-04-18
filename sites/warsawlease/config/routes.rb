# frozen_string_literal: true

Warsawlease::Engine.routes.draw do
  mount Warsawlease::Api::Base => '/'
end
