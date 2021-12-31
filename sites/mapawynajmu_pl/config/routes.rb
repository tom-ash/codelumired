# frozen_string_literal: true

MapawynajmuPl::Engine.routes.draw do
  mount MapawynajmuPl::Api::Base => '/'
end
