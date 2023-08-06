Rails.application.routes.draw do
  mount SkillfindTech::Engine => '/skillfind-tech'
  mount MapawynajmuPl::Engine => '/mapawynajmu-pl'
end
