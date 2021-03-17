# frozen_string_literal: true

module Warsawlease
  module AnnouncementsDestroy
    def destroy
      @user ||= ::Queries::User::SingleByAccessToken.new(access_token: request.headers['Access-Token'], site_name: 'Warsawlease' ).call

      announcement = Announcement.find_by_id(params[:id])
      return bad_request unless @user.id == announcement.user_id

      announcement.destroy!

      render json: {}
    end
  end
end
