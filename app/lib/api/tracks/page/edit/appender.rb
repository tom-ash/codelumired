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
              title: page.title,
              cover_image: page.cover_image,
              updatePageApiUrl: "#{api_url}/page/update",
              indexNowApiUrl: "#{api_url}/page/index-now",
              name: nil,
              langVerUrls: nil,
              updated: true,
              indexNowPingedAt: page.index_now_pinged_at&.to_date
            }
          end

          def serialized_page
            @serialized_page ||= ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call
          end

          def inputs
            serialized_page.merge(
              body: JSON.pretty_generate(page.body),
              meta: JSON.pretty_generate(serialized_page['meta']),
              autoSchema: JSON.pretty_generate(serialized_page['auto_schema']),
              manualSchema: JSON.pretty_generate(serialized_page['manual_schema']),
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
                indexNowButtonLabel: 'IndexNow',
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
                indexNowButtonLabel: 'IndexNow',
              },
            }[lang]
          end

          def page
            page_url = url.match(%r{^(pages|strony)/(.+)$})[2]
            site::Page.find_by(url: page_url)
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
