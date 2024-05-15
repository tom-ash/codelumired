# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Users
          module Edit
            module Meta
              TRACK = 'user/users/edit'

              UNLOCALIZED_PATH = {
                en: 'account',
                pl: 'pl/konto',
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'Account',
                pl: 'Konto',
              }.freeze

              private

              def label
                {
                  en: 'Settings',
                  pl: 'Ustawienia',
                }[lang]
              end

              def icon
                'cog'
              end

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def unlocalized_title
                @unlocalized_title ||= UNLOCALIZED_TITLE
              end

              def unlocalized_keywords
                @unlocalized_keywords ||= {
                  en: 'TODO',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  en: 'TODO',
                }.freeze
              end

              def render
                {
                  'user/users/edit': true,
                }
              end

              def links
                {
                  'current/en': ::SkillfindTech::Api::Tracks::User::Users::Edit::Linker.new(:en).call,
                  'current/pl': ::SkillfindTech::Api::Tracks::User::Users::Edit::Linker.new(:pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
