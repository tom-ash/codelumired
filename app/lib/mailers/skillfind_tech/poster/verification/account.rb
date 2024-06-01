# frozen_string_literal: true

# ::Mailers::SkillfindTech::Poster::Verification::Account

module Mailers
  module SkillfindTech
    module Poster
      module Verification
        class Account
          def initialize(email:, lang:, verification_code:)
            @email = email
            @lang = lang
            @verification_code = verification_code
          end

          # TODO: MOVE TO MODULE!
          def getTexts(path)
            JSON.parse(File.read(path)).deep_symbolize_keys
          end

          def send
            # TODO: Use custom error.
            raise StandardError unless [email, lang, verification_code].all?

            TransactionalMailer.skillfind_tech_verification_email(
              to: email,
              subject: subject,
              verification_code: verification_code,
              lang: lang,
            ).deliver_now
          end

          private

          attr_reader :email, :lang, :verification_code

          def subject
            localizations[:subject]
          end

          def localizations
            @localizations ||= getTexts("app/lib/mailers/skillfind_tech/poster/verification/localizations/#{lang}.json")
          end
        end
      end
    end
  end
end
