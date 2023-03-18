# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        class Appender < ::Api::Tracks::Common::Appender
          include ::Api::Tracks::Page::Edit::Meta

          private

          def authorize!
            raise UnauthorizedError unless authenticated_user&.role == 'admin'
          end

          def control
            {
              nav: 'body',
            }
          end

          def data
            {
              body: page.body,
              updatePageApiUrl: "#{api_url}/page/update",
              name: nil,
              langVerUrls: nil,
              updated: true,
            }
          end

          def serialized_page
            @serialized_page ||= camelize(
              ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call,
            )
          end

          def inputs
            serialized_page.merge(
              body: JSON.pretty_generate(page.body),
              meta: JSON.pretty_generate(serialized_page['meta']),
              autoSchema: JSON.pretty_generate(serialized_page['autoSchema']),
              manualSchema: JSON.pretty_generate(serialized_page['manualSchema']),
            )
          end

          def texts
            {
              pl: {
                urlInputLabel: 'URL',
                canonicalUrlInputLabel: 'Canonical URL',
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
                urlInputLabel: 'URL',
                canonicalUrlInputLabel: 'Kanoniczny URL',
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
            response.as_json.transform_keys do |key|
              key.exclude?('/') ? key.to_s.camelize(:lower) : key
            end
          end

          def image
            page.cover_image
          end

          def title
            page.title
          end
        end
      end
    end
  end
end
