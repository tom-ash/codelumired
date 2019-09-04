module AnnouncementsUpdate
  EDIT_ATTRIBUTES = %i[id user_id category district pictures area rooms net_rent_amount rent_currency additional_fees
                       created_at updated_at availability_date
                       floor total_floors features furnishings polish_description english_description
                       map_latitude map_longitude]

  EDIT_SYMBOLS = %I[active category district net_rent_amount rent_currency additional_fees area rooms floor total_floors
                    pictures availability_date features furnishings polish_description english_description map_latitude
                    map_longitude ]

  def edit
    render_400 and return unless user_validated?
    @announcement = Announcement.where(id: params[:id]).select(EDIT_ATTRIBUTES).take.serializable_hash
                                                                               .with_indifferent_access
    render_400 and return unless owner?
    @announcement.delete(:user_id)
    parse_availability_date_for_update
    render json: { announcement: @announcement }
  end

  def update
    render_400 and return unless user_validated?
    find_announcement
    render_400 and return unless owner?
    prepare_update_object
    handle_availability_date
    update_attributes
    render_201
  end

  private

  def owner?
    @user.id == User.find(@announcement[:user_id]).id
  end

  def parse_availability_date_for_update
    @announcement[:availability_date] = 'now' if Date.current > @announcement[:availability_date]
  end

  def find_announcement
    @announcement = Announcement.find_by(id: params[:id])
  end

  def prepare_update_object
    @announcement_object = {}
    @announcement_object.tap do |announcement_object|
      for symbol in EDIT_SYMBOLS
        next if params[symbol] == nil
        announcement_object[symbol] = params[symbol]
      end
    end
  end

  def update_attributes
    @announcement.update_attributes(@announcement_object)
  end
end