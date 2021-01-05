# frozen_string_literal: true

module AnnouncementsDestroy
  def destroy
    return bad_request unless user_validated? && owner?

    Announcement.find_by_id(params[:id]).destroy
    return bad_request unless @user.id == announcement.user_id
    
    render json: {}
  end
end
