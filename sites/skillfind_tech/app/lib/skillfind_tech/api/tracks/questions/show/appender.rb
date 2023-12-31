# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Questions
        module Show
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Questions::Show::Meta

            HOMEPAGE = {
              pl: 'Strona główna',
              en: 'Homepage',
            }

            private

            def practiceProblemPath(lang)
              {
                en: 'practice-problems',
                pl: 'cwiczenia',
              }[lang]
            end

            def data
              match_data
              {
                title: question.title,
                type: type,
                body: question.body,
                answers: answers,
                hint: question.hint,
                isSubmitted: false,
                isAnsweredCorrectly: nil,
                isSingleChoice: type == 'singleChoice',
                isMultipleChoice: type == 'multipleChoice',
                isAnyAnswerSelected: false,
                # category_path: category_path,
                breadcrumbs: breadcrumbs,
              }
            end

            def breadcrumbs
              @breadcrumbs ||= begin
                parents = []

                parents.push(
                  name: practiceProblemPath(lang),
                  lang: lang,
                  item: "/#{category["path_#{lang}"]}/#{practiceProblemPath(lang)}",
                )

                parents.push(
                  name: category[lang],
                  lang: lang,
                  item: "/#{category["path_#{lang}"]}",
                )
  
                parents.push(
                  name: HOMEPAGE[lang],
                  lang: lang,
                  item: site::Api::Tracks::Root::Linker.new(lang).call[:href],
                )
  
                parents.reverse
              end
            end

            def category
              @category ||= ::SkillfindTech::Category.find_by("path_#{lang}": category_path)
            end

            def question
              @question ||= ::SkillfindTech::Question.find_by!(
                url: question_path,
                category_id: category,
              )
            end

            def type
              @type ||= question.question_type
            end

            def question_path
              @question_path ||= match_data[:question_path]
            end

            def category_path
              @category_path ||= match_data[:category_path]
            end

            def answers
              question.answers.sort_by(&:position).map do |answer|
                {
                  position: answer.position,
                  body: answer.body,
                  isCorrect: answer.is_correct,
                  isSelected: false,
                  explanation: answer.explanation,
                  hint: answer.hint,
                }
              end
            end

            def asset_names
              @asset_names ||= %i[
                retry
                questionMark
                dice
                send
                paperPlane
                check
                home
              ]
            end

            # def breadcrumbs
            #   @breadcrumbs ||= begin
            #     parents = []
  
            #     buildBreadcrumbs(parents, page)
  
            #     parents.push(
            #       name: HOMEPAGE[lang],
            #       lang: lang,
            #       item: site::Api::Tracks::Root::Linker.new(lang).call[:href],
            #     )
  
            #     parents.reverse
            #   end
            # end
          end
        end
      end
    end
  end
end
