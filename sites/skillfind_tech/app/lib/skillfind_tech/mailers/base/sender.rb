# frozen_string_literal: true

module SkillfindTech
  module Mailers
    module Base
      class Sender < ActionMailer::Base
        include ::Helpers::Texts

        default from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>"
        layout 'skillfind_tech_mailer'

        def prepare(to:, lang:)
          @to = to
          @lang = lang
          @hello = hello
          @salutations = salutations
          @company = company
          @signature = 'skillfind.tech'
        end

        private

        attr_reader :lang

        def hello
          localizations[:hello]
        end
        
        def company
          localizations[:company]
        end

        def salutations
          localizations[:salutations]
        end

        def localizations
          @base_localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/mailers/base/localizations/#{lang}.json")
        end
      end
    end
  end
end
