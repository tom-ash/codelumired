# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Root
        class Linker
          include Codelumi::Api::Tracks::Helpers::Linker
          include Codelumi::Api::Tracks::Root::Meta
        end
      end
    end
  end
end
