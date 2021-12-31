Rails.application.routes.draw do
  mount SoundofIt::Engine => '/soundof_it'
  mount MapawynajmuPl::Engine => '/mapawynajmu_pl'
end
