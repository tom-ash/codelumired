Rails.application.routes.draw do
  mount SkillfindTech::Engine => '/skillfind_tech'
  mount MapawynajmuPl::Engine => '/mapawynajmu-pl'
end
