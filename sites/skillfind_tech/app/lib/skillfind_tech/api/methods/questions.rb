# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Questions < Grape::API
        get do
          # TODO: Handle other langs.
          question = ::SkillfindTech::Question.all.sample
          category = ::SkillfindTech::Category.find_by!(id: question.category_id)
          "/#{category.path_en}/practice-problems/#{question.url}"
        end
      end
    end
  end
end
