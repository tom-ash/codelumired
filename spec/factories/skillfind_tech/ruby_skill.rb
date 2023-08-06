# frozen_string_literal: true

FactoryBot.define do
  factory :ruby_skill, class: ::SkillfindTech::Skill do
    name { 'Ruby' }
    type { ::SkillfindTech::Language }
    description { 'TODO' }
  end
end
