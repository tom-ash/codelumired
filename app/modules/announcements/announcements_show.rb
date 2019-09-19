module AnnouncementsShow
  def show
    attributes = only_tile? ? tile_attributes : full_attributes
    @announcement = Announcement.where(id: params[:id]).select(attributes).take
    return render_409 unless @announcement.status == 1

    unless only_tile?
      user = @announcement.user
      @announcement.user_id = nil
    end
    @announcement = @announcement.as_json.with_indifferent_access
    parse_availability_date
    @announcement[:name] = only_tile? ? '' : user.showcase['businessName']
    @announcement[:phone] = user.showcase['phone'] unless only_tile?
    render json: @announcement
  end

  private

  def only_tile?
    @only_tile = request.headers['Only-Tile'] == 'true'
  end

  def tile_attributes
    AnnouncementsAttributes::SHOW_TILE
  end

  def full_attributes
    AnnouncementsAttributes::SHOW_FULL
  end
end
