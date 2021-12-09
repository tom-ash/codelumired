module Warsawlease
  module Api
    module Tracks
      module Root
        class Mapper
          include ::Warsawlease::Api::Tracks::Root::Meta

          def call
            [
              [
                { path: '', lang: :pl, changefreq: 'daily', priority: '1.0' },
                { path: 'en', lang: :en, changefreq: 'daily', priority: '1.0' }
              ]
            ]
          end

          private

          # TODO
        end
      end
    end
  end
end
