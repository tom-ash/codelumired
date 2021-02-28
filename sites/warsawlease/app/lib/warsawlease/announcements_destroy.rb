# frozen_string_literal: true

module Warsawlease
  module AnnouncementsDestroy
    def destroy
      return bad_request unless user_validated?

      announcement = Announcement.find_by_id(params[:id])
      return bad_request unless @user.id == announcement.user_id

      announcement.destroy!

      render json: {}
    end
  end
end
