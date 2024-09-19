# frozen_string_literal: true

FactoryBot.define do
  factory :javascript_skill, class: ::SkillfindTech::Skill do
    value { 'JavaScript' }
    route_en { 'javascript' }
    route_pl { 'javascript' }
  end
end
