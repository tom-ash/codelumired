# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::Edit::Meta

          private

          def authorize!
            raise UnauthorizedError unless authenticated_user&.role == 'admin'
          end

          def control
            {
              fetching: false,
              nav: 'body',
            }
          end

          def data
            {
              updatePageApiUrl: "#{api_url}/page/update",
              name: nil,
              langVerUrls: nil,
              updated: true,
            }
          end

          def inputs
            serialized_page = camelize(::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call)

            serialized_page.merge(
              body: JSON.pretty_generate(serialized_page['body']),
              meta: JSON.pretty_generate(serialized_page['meta']),
              auto_schema: JSON.pretty_generate(serialized_page['autoSchema']),
              manual_schema: JSON.pretty_generate(serialized_page['manualSchema']),
            )
          end

          def texts
            {
              pl: {
                publishedOnInputLabel: 'Opublikowano w',
                modifiedOnInputLabel: 'Zmodyfikowano w',
                categoryInputLabel: 'Kategoria',
                subcategoryInputLabel: 'Podkategoria',
                pageLangInputLabel: 'Język',
                langAltsGroupInputLabel: 'UUID grupy alternatywnych języków',
                titleInputLabel: 'Tytuł',
                coverImageInputLabel: 'Obraz okładkowy',
                descriptionTextareaLabel: 'Opis',
                keywordsTextareaLabel: 'Słowa kluczowe',
                schemaModeSwitchLabel: 'Automatyczna Schema',
                onlineSwitchLabel: 'Online',
                updatePageButtonLabel: 'Zapisz',
                updatePageAndExitButtonLabel: 'Zapisz',
              },
              en: {
                publishedOnInputLabel: 'Published On',
                modifiedOnInputLabel: 'Modified On',
                categoryInputLabel: 'Category',
                subcategoryInputLabel: 'Subcategory',
                pageLangInputLabel: 'Language',
                langAltsGroupInputLabel: 'Language Alternates Group UUID',
                titleInputLabel: 'Tytuł',
                coverImageInputLabel: 'Cover Image',
                descriptionTextareaLabel: 'Description',
                keywordsTextareaLabel: 'Keywords',
                schemaModeSwitchLabel: 'Auto Schema',
                onlineSwitchLabel: 'Online',
                updatePageButtonLabel: 'Save',
                updatePageAndExitButtonLabel: 'Save & Exit',
              },
            }[lang]
          end

          def page
            page_url = url.match(%r{^(pages|strony)/(.+)$})[2]
            site::Page.find_by(url: page_url)
          end

          # TODO: -> Move to service.
          def camelize(response)
            response.as_json.deep_transform_keys do |key|
              key.exclude?('/') ? key.to_s.camelize(:lower) : key
            end
          end
        end
      end
    end
  end
end
