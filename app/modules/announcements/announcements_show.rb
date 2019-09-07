module AnnouncementsShow
  FULL_ATTRIBUTES = %i[id user_id category district pictures area rooms net_rent_amount rent_currency additional_fees
                       floor total_floors availability_date features furnishings polish_description english_description
                       latitude longitude]

  TILE_ATTRIBUTES = %i[id category district pictures area rooms net_rent_amount rent_currency additional_fees floor
                       total_floors availability_date ]

  def show
    attributes = only_tile? ? TILE_ATTRIBUTES : FULL_ATTRIBUTES
    @announcement = Announcement.where(id: params[:id]).select(attributes).take
    if !only_tile?
      user = @announcement.user
      @announcement.user_id = nil
    end
    @announcement = @announcement.as_json.with_indifferent_access
    @announcement[:availability_date] = parse_availability_date
    @announcement[:name] = only_tile? ? '' : user.showcase['businessName']
    @announcement[:phone] = user.showcase['phone'] if !only_tile?
    render json: @announcement
  end
end

private

def only_tile?
  @only_tile = request.headers['Only-Tile'] == 'true'
end

def parse_availability_date
  availability_date = @announcement[:availability_date]
  availability_date <= Date.today ? 'now' : availability_date
end