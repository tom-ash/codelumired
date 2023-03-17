# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Index
          class Appender < ::Api::Tracks::Image::Index::Appender
            include ::SkillfindTech::Api::Tracks::Image::Index::Meta
          end
        end
      end
    end
  end
end
