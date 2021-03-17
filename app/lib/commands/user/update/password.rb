# frozen_string_literal: true

module Commands
  module User
    module Update
      class Password
        include SiteName

        def initialize(user_id:, password:, site_name:)
          @user_id = user_id
          @password = password
          @site_name = site_name
        end

        def call
          ::Ciphers::User::HashPassword.new(user: user, password: password).call

          user.save!
        end

        private

        attr_reader :user_id, :password, :site_name

        def user
          @user ||= site::User.find(user_id)
        end
      end
    end
  end
end
