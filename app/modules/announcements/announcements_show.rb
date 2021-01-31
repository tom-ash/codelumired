module AnnouncementsShow
  def show
    attributes = only_tile? ? tile_attributes : full_attributes
    @announcement = Announcement.find_by(id: params[:id])
    return render_404 unless @announcement&.visible?

    @attributes = @announcement.attributes.slice(*attributes)

    unless only_tile?
      user = @announcement.user
      @announcement.user_id = nil
    end

    @attributes = @attributes.as_json.with_indifferent_access
    parse_availability_date
    @attributes[:name] = only_tile? ? '' : user.showcase['name']
    @attributes[:phone] = user.showcase['phone'] unless only_tile?
    @response = @attributes.merge(svgs: SVG.all)
    ok
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
