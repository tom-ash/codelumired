# frozen_string_literal: true

module Mailers
  class Verification
    include SiteName

    SUBJECTS = {
      'user/create/email-and-password': { pl: 'Potwierdzenie konta', en: 'Account Confirmation' },
      'user/update/email/current': { pl: 'Zmiana adresu email - weryfikacja aktualnego adresu email', en: 'Email Address Change - Current Email Verification' },
      'user/update/email/new': { pl: 'Zmiana adresu email - weryfikacja nowego adresu email', en: 'Email Address Change - New Email Verification' },
      'user/update/password': { pl: 'Resetowanie hasła', en: 'Password Reset' },
      'user/delete': { pl: 'Usuwanie konta', en: 'Account Deletion' }
    }.with_indifferent_access.freeze

    def initialize(user: nil, email:, namespace:, lang:, site_name:)
      @user = user
      @email = email
      @namespace = namespace
      @lang = lang
      @site_name = site_name
    end

    def send
      raise StandardError unless [email, namespace, lang, site_name].all?

      TransactionalMailer.verification_email(
        to: email,
        subject: subject,
        verification_code: verification_code,
        lang: lang
      ).deliver_now
    end

    private

    attr_reader :email, :namespace, :lang, :site_name

    def subject
      SUBJECTS[namespace][lang]
    end

    def verification_code
      @verification_code ||= ::Commands::User::Update::Verification.new(user: user, namespace: namespace).build_and_persist
    end

    def user
      @user ||= begin
        site::User.find_by(email: email)
      end
    end
  end
end
