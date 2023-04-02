# frozen_string_literal: true

module Api
  module Tracks
    module Common
      module State
        private

        def merge_state
          state.merge!(
            render: render,
            user: user,
            meta: meta_preview,
            texts: texts.merge(common_texts),
            assets: { svgs: assets },
            links: links,
            control: control,
            data: data,
            inputs: inputs,
            errors: errors,
          )
        end

        def state
          @state ||= attrs[:state]
        end

        def render
          {}
        end

        def user
          return blank_user if authenticated_user.blank?

          ::Serializers::User::Show.new(user: authenticated_user, constantized_site_name: constantized_site_name).call
        end

        def blank_user
          {
            authorized: false,
            accountType: nil,
            role: nil,
          }
        end

        def meta_preview
          return {} unless Rails.env == 'development'

          meta
        end

        def texts
          {}
        end

        def assets
          ::MapawynajmuPl::Asset.where(name: asset_names).each_with_object({}) do |svg, serialized_svgs|
            serialized_svgs[svg.name.to_s] = { path_data: svg.path_data, view_box: svg.view_box }
          end
        end

        def links
          {}
        end

        def control
          {}
        end

        def data
          {}
        end

        def inputs
          {}
        end

        def errors
          {}
        end

        def authenticated_user
          @authenticated_user ||= attrs[:authenticated_user]
        end

        def asset_names
          @asset_names ||= %w[
            chevron
          ]
        end

        def common_texts
          {
            pl: {
              signOutButtonLabel: 'Wyloguj',
              showMyAccountMenuButtonLabel: 'Moje konto',
              allRightsReserved: 'Wszelkie prawa zastrzeżone.',
            },
            en: {
              signOutButtonLabel: 'Sign Out',
              showMyAccountMenuButtonLabel: 'My account',
              allRightsReserved: 'All rights reserved.',
            },
          }[lang]
        end
      end
    end
  end
end
