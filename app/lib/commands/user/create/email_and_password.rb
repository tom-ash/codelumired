# frozen_string_literal: true

module Commands
  module User
    module Create
      class EmailAndPassword
        def initialize(attrs)
          @attrs = attrs
          @email = attrs[:email]
          @password = attrs[:password]
          @constantized_site_name = attrs[:constantized_site_name]
        end

        def call
          return if user.confirmed?

          assign_basic_attrs
          ::Parsers::User::Consents.new(user: user, consents: attrs[:consents]).call
          ::Ciphers::User::HashPassword.new(user: user, password: password).call
          site::Helpers::DecorateUser.new(user: user, attrs: attrs).call

          user.save!
          user
        end

        private

        attr_reader :attrs, :email, :password, :constantized_site_name

        def user
          @user ||= site::User.find_or_initialize_by(email: email)
        end

        def assign_basic_attrs
          user.assign_attributes(status: 0, change_log: [])
        end

        def site
          @site ||= Object.const_get(constantized_site_name)
        end
      end
    end
  end
end
