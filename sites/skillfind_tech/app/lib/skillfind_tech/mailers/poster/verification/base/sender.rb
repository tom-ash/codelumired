# frozen_string_literal: true

module SkillfindTech
  module Mailers
    module Poster
      module Verification
        module Base
          class Sender < ::SkillfindTech::Mailers::Base::Sender
            def prepare(to:, verification_code:, lang:)
              super(to:, lang:)

              @hello = hello
              @verification_code_message = verification_code_message
              @signature = 'skillfind.tech'
              @salutations = salutations
              @company = company

              mail(
                from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>",
                to: @to,
                subject: subject,
                template_path: 'notifications',
                template_name: 'create',
              )
            end
          end
        end
      end
    end
  end
end
