# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Linker
          include ::Warsawlease::Api::Tracks::Helpers::Linker
          include ::Warsawlease::Api::Tracks::Root::Meta

          private

          def url
            { pl: root_domain, en: "#{root_domain}/en" }[lang]
          end
        end
      end
    end
  end
end
