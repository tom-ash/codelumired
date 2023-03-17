# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Common
        class Appender < ::Api::Tracks::Common::Appender
          include ::SkillfindTech::ProtocolAndDomain
        end
      end
    end
  end
end
