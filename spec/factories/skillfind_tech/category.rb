# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: ::SkillfindTech::Category do
    name { 'javascript' }
    pl { 'JavaScript' }
    en { 'JavaScript' }
  end
end
