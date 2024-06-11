# frozen_string_literal: true

module SkillfindTech
  module Mailers
    module Postings
      module Confirmation
        class Sender < ::SkillfindTech::Mailers::Base::Sender
          include ::SkillfindTech::Api::Tracks::Posting::Common::Postings

          def prepare(to:, lang:, posting_id:)
            super(to: to, lang: lang)

            @posting_id = posting_id
            posting = ::SkillfindTech::Posting.find(posting_id)
            @posting_href = "#{SKILLFIND_TECH_URL}#{posting_href(posting, lang)}"
            @image = "https://#{ENV['SKILLFIND_TECH_AWS_S3_BUCKET']}.s3.eu-central-1.amazonaws.com/postings/#{posting_id}/image.png"
            @congratulations = congratulations

            mail(
              from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>",
              to: @to,
              subject: subject,
              template_path: 'postings',
              template_name: 'confirmation',
            )
          end

          private

          attr_reader :posting_id

          def congratulations
            localizations[:congratulations]
          end

          def subject
            localizations[:subject]
          end

          def localizations
            @localizations ||= super.merge(getTexts("sites/skillfind_tech/app/lib/skillfind_tech/mailers/postings/confirmation/localizations/#{lang}.json"))
          end
        end
      end
    end
  end
end
