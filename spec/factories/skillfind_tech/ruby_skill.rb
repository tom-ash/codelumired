# frozen_string_literal: true

FactoryBot.define do
  factory :ruby_skill, class: ::SkillfindTech::Skill do
    value { 'Ruby' }
    route_en { 'ruby' }
    route_pl { 'ruby' }
  end
end
