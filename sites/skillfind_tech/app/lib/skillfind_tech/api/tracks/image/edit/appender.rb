# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Edit
          class Appender < ::Api::Tracks::Image::Edit::Appender
            include ::SkillfindTech::Api::Tracks::Image::Edit::Meta
          end
        end
      end
    end
  end
end
