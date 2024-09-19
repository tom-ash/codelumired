# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: ::SkillfindTech::Category do
    name { 'javascript' }
    en { 'JavaScript' }
    pl { 'JavaScript' }
    path_en { 'javascript' }
    path_pl { 'pl/javascript' }
  end
end
