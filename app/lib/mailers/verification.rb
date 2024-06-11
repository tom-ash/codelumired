# frozen_string_literal: true

module Mailers
    class Verification
      include SiteName
  
      SUBJECTS = {
        'user/create/email-and-password': { pl: 'Potwierdzenie konta', en: 'Account Confirmation' },
        'user/update/email/current': { pl: 'Zmiana adresu email - weryfikacja aktualnego adresu email', en: 'Email Address Change - Current Email Verification' },
        'user/update/email/new': { pl: 'Zmiana adresu email - weryfikacja nowego adresu email', en: 'Email Address Change - New Email Verification' },
        'user/update/password': { pl: 'Resetowanie hasła', en: 'Password Reset' },
        'user/delete': { pl: 'Usuwanie konta', en: 'Account Deletion' },
      }.with_indifferent_access.freeze
  
      def initialize(user: nil, email:, namespace:, lang:, verification_code:)
        @user = user
        @email = email
        @namespace = namespace
        @lang = lang
        @verification_code = verification_code
      end
  
      def send
        raise StandardError unless [email, namespace, lang, verification_code].all?
  
        TransactionalMailer.verification_email(
          to: email,
          subject: subject,
          verification_code: verification_code,
          lang: lang,
        ).deliver_now
      end
  
      private
  
      attr_reader :email, :namespace, :lang, :verification_code
  
      def subject
        SUBJECTS[namespace][lang]
      end
  
      def user
        @user ||= begin
          site::User.find_by(email: email)
        end
      end
    end
  end