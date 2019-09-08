module AnnouncementsUpdate
  def edit
    return render_400 unless user_validated?

    @announcement = Announcement.where(id: params[:id]).select(edit_attributes)
                                .take.serializable_hash.with_indifferent_access
    return render_400 unless owner?

    @announcement.delete(:user_id)
    parse_availability_date
    render json: { announcement: @announcement }
  end

  def update
    return render_400 unless user_validated?

    find_announcement
    return render_400 unless owner?

    prepare_update_object
    handle_rent_amount
    handle_availability_date
    update_announcement
    render_201
  end

  private

  def owner?
    @user.id == User.find(@announcement[:user_id]).id
  end

  def find_announcement
    @announcement = Announcement.find_by(id: params[:id])
  end

  def prepare_update_object
    @announcement_object = {}
    update_attributes.each do |symbol|
      next if params[symbol].nil?

      @announcement_object[symbol] = params[symbol]
    end
  end

  def update_announcement
    @announcement.update_attributes(@announcement_object)
  end

  def edit_attributes
    AnnouncementsAttributes::EDIT
  end

  def update_attributes
    AnnouncementsAttributes::UPDATE
  end
end
