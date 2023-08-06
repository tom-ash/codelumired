# frozen_string_literal: true

FactoryBot.define do
  factory :javascript_skill, class: ::SkillfindTech::Skill do
    name { 'JavaScript' }
    type { ::SkillfindTech::Language }
    description { 'TODO' }
  end
end
