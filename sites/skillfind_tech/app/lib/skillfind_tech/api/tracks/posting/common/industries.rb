# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module Industries
            private

            def industries
              @industries = JSON.parse(File.read('sites/skillfind_tech/fixtures/industries.json'))
            end
  
            def getIndustry(value)
              industries.find do |i|
                i['value'] == value
              end
            end
          end
        end
      end
    end
  end
end
