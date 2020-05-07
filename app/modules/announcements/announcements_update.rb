module AnnouncementsUpdate
  def edit
    return bad_request unless user_validated?

    @attributes = Announcement.where(id: params[:id]).select(edit_attributes).take.serializable_hash.with_indifferent_access
    return bad_request unless owner?

    @attributes.delete(:user_id)
    @announcement = @attributes
    parse_availability_date
    @response = @announcement
    ok
  end

  def update
    return bad_request unless user_validated?

    find_announcement
    return bad_request unless owner?

    prepare_update_object
    handle_rent_amount
    handle_availability_date
    update_announcement
    ok
  end

  def view
    announcement = Announcement.find(params[:id])
    views = announcement.views
    announcement.update_attribute(:views, views + 1)
  end

  def extend_active
    return bad_request unless user_validated?

    announcement = Announcement.find(params[:id])
    active_until = Date.today + 60.days
    @response = { active_until: active_until }
    ok if announcement.update_attribute(:active_until, active_until)
  end

  def trigger_visible
    return bad_request unless user_validated?

    announcement = Announcement.find(params[:id])

    ok if announcement.update_attribute(:visible, !announcement.visible)
  end

  private

  def owner?
    @user.id == User.find(@attributes[:user_id]).id
  end

  def find_announcement
    @attributes = Announcement.find_by(id: params[:id])
  end

  def prepare_update_object
    @announcement_object = {}
    update_attributes.each do |symbol|
      next if params[symbol].nil?

      @announcement_object[symbol] = params[symbol]
    end
  end

  def update_announcement
    @attributes.update_attributes(@announcement_object)
  end

  def edit_attributes
    AnnouncementsAttributes::EDIT
  end

  def update_attributes
    AnnouncementsAttributes::UPDATE
  end
end
