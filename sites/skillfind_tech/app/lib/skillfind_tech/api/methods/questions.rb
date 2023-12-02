# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Questions < Grape::API
        get do
          "/questions/#{::SkillfindTech::Question.pluck(:url).sample}"
        end
      end
    end
  end
end
