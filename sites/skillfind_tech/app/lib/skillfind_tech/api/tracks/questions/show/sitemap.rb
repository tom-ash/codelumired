# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          class Sitemap
            class << self
              def get
                questionLinkGroups
              end

              private

              def questionLinkGroups
                linkGroups = []

                ::SkillfindTech::Question.all.each do |question|
                  linkGroup = []

                  lang = question.lang.to_sym
                  category = ::SkillfindTech::Category.find(question.category_id)

                  linkGroup << {
                    href: "/#{categoryPath(category, lang)}/#{questionPath(lang)}/#{question.url}",
                    hrefLang: lang,
                    changeFreq: 'monthly',
                    priority: '1.0'
                  }

                  linkGroups << linkGroup
                end

                linkGroups
              end

              def categoryPath(category, lang)
                category.send(:"path_#{lang}")
              end

              def questionPath(lang)
                {
                  en: 'questions',
                  pl: 'pytania',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
