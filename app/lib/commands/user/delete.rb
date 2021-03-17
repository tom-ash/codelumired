# frozen_string_literal: true

module Commands
  module User
    class Delete
      include SiteName

      def initialize(user_id:, site_name:)
        @user_id = user_id
        @site_name = site_name
      end

      def call
        ActiveRecord::Base.transaction do
          deleted_user.update!(original_user: @user)
          user.destroy!
        end
      end

      private

      attr_reader :user_id, :site_name

      def user
        @user ||= site::User.find(user_id)
      end

      def deleted_user
        @deleted_user ||= site::DeletedUser.find_by(id: user.id) || site::DeletedUser.new(id: user.id, original_user: {})
      end
    end
  end
end
