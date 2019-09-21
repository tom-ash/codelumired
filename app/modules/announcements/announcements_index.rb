module AnnouncementsIndex
  def index
    return list if params[:type] == 'list'

    search_announcements
    render json: handle_response
  end

  def list
    return render_400 unless user_validated?

    prepare_announcements
    filter_announcements
    limit_announcements
    sort_announcements
    select_attributes
    render json: {
      amount: @amount,
      announcements: @announcements
    }
  end

  private

  def search_announcements
    @announcements = Announcement.where(status: 1, visible: true)
    handle_equal_attributes
    handle_minimal_attributes
    handle_maximal_attributes
  end

  def handle_equal_attributes
    equal_attributes.each do |attribute|
      value = params[attribute]
      next unless value

      @announcements = @announcements.where(attribute => value)
    end
  end

  def handle_minimal_attributes
    minimal_attributes.each do |attribute|
      value = params[attribute]
      next unless value

      @announcements = @announcements.where("#{attribute[4..-1]} >= ?", value)
    end
  end

  def handle_maximal_attributes
    maximal_attributes.each do |attribute|
      value = params[attribute]
      next unless value

      attribute = attribute == :availability_date ? attribute : attribute[4..-1]
      @announcements = @announcements.where("#{attribute} <= ?", value)
    end
  end

  def handle_response
    request_header = request.headers
    return { amount: panel_announcements } if request_header['Only-Amount'] == 'true'

    return { announcements: map_announcements, amount: @amount  } if request_header['Only-Locations'] == 'true'

    { announcements: full_announcements, amount: @amount }
  end

  def panel_announcements
    @amount = @announcements.count
  end

  def map_announcements
    @amount = @announcements.count
    @announcements = @announcements.where.not(latitude: nil, longitude: nil).limit(50)
    @announcements.select(map_attributes)
  end

  def full_announcements
    @amount = @announcements.count
    @announcements.limit(per_page).offset(offset).select(full_attributes)
  end

  def prepare_announcements
    @amount = @user.announcements.count
    @announcements = @user.announcements
  end

  def offset
    page = params[:page]
    ['', '1'].include?(page) ? 0 : page.to_i * per_page - per_page
  end

  def filter_announcements
    filters.each do |filter|
      next if request.headers[filter[:name]] == 'true'

      @announcements = @announcements.where.not(filter[:attribute] => filter[:value])
    end
    @amount = @announcements.count
  end

  def limit_announcements
    @announcements = @announcements.limit(per_page).offset!(offset)
  end

  def sort_announcements
    @announcements = @announcements.order(sorters[request.headers[:sort]])
  end

  def select_attributes
    @announcements = @announcements.select(
      [*full_attributes, %i[
        views
        status
        distinct
        visible
        active_until
        created_at
        updated_at
      ]]
    )
  end

  def full_attributes
    AnnouncementsAttributes::INDEX_FULL
  end

  def map_attributes
    AnnouncementsAttributes::INDEX_MAP
  end

  def equal_attributes
    AnnouncementsAttributes::INDEX_EQUAL
  end

  def minimal_attributes
    AnnouncementsAttributes::INDEX_MINIMAL
  end

  def maximal_attributes
    AnnouncementsAttributes::INDEX_MAXIMAL
  end

  def per_page
    AnnouncementsAttributes::INDEX_PER_PAGE
  end

  def filters
    AnnouncementsAttributes::INDEX_FILTERS
  end

  def sorters
    AnnouncementsAttributes::INDEX_SORTERS
  end
end
