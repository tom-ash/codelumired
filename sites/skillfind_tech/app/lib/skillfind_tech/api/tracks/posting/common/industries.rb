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

            def industryIcons
              @industryIcons ||= industries.map { |industry| industry['icon'] }
            end

            def localizedIndustry(value)
              @localizedIndustry ||= localizedIndustries.find do |industry|
                industry[:value] == value
              end
            end

            def localizedIndustries
              @localizedIndustries ||= industries.map do |industry|
                {
                  value: industry['value'],
                  label: industry[lang.to_s],
                  icon: industry['icon'],
                }
              end
            end

            def industrySelectOptions
              @industrySelectOptions ||= industries.sort_by { |industry| industry[lang.to_s] }.map do |industry|
                {
                  value: industry['value'],
                  text: industry[lang.to_s],
                  icon: industry['icon'],
                }
              end
            end
          end
        end
      end
    end
  end
end
