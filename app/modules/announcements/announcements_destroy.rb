module AnnouncementsDestroy
  def destroy
    render_400 and return unless user_validated?



    Announcement.find_by(id: params[:id]).destroy
    render json: {}
  end
end