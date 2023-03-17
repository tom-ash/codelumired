# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module Edit
          class Appender < ::Api::Tracks::Page::Edit::Appender
            include ::SkillfindTech::Api::Tracks::Page::Edit::Meta
          end
        end
      end
    end
  end
end
