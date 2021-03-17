# frozen_string_literal: true

module Commands
  module User
    module Update
      class GenericAttr
        include SiteName

        def initialize(user_id:, name:, value:, site_name:)
          @user_id = user_id
          @name = name
          @value = value
          @site_name = site_name
        end

        def call
          user.update!("#{name}": value)
        end

        private

        attr_reader :user_id, :name, :value, :site_name

        def user
          @user ||= site::User.find(user_id)
        end
      end
    end
  end
end
