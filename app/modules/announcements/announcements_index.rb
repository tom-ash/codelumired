module AnnouncementsIndex
  def index
    return list if request.headers['my']

    search_announcements
    prepare_response
    ok
  end

  def list
    return bad_request unless user_validated?

    prepare_announcements
    limit_announcements
    sort_announcements
    select_attributes
    @response = { amount: @amount, announcements: @announcements.map(&:attributes).to_a }
    ok
  end

  def search_announcements
    @announcements = Announcement.where(status: 1, visible: true).order('points DESC').order('active_until DESC')
    handle_rent
    handle_equal_attributes
    handle_minimal_attributes
    handle_maximal_attributes
  end

  private

  def handle_rent
    @min_rent = params[:min_rent]
    @max_rent = params[:max_rent]
    @announcements = @announcements.where('gross_rent_amount_int >= ?', @min_rent.to_i * 100) if @min_rent
    @announcements = @announcements.where('gross_rent_amount_int <= ?', @max_rent.to_i * 100) if @max_rent
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

  def prepare_response
    @response = {
      announcements: announcements,
      amount: amount,
      svgs: SVG.all
    }

    name = 'welcome'
    post_language_variations = Post.where(name: name)
    post = { name: name }

    post_language_variations.each do |language_variation|
      post[language_variation.lang.to_sym] = language_variation.slice(:meta, :url, :title, :body)
    end

    @response.merge!(welcome: post) if params[:with_welcome] == 'true'
  end

  def announcements
    @announcements.limit(per_page)
                  .offset(params[:offset])
                  .select(AnnouncementsAttributes::INDEX_FULL).each do |item|

      item = item.attributes
      item['latitude'] = item['latitude'].to_f / 1_000_000
      item['longitude'] = item['longitude'].to_f / 1_000_000
    end
  end

  def amount
    @announcements.count
  end

  def prepare_announcements
    @amount = @user.announcements.count
    @announcements = @user.announcements
  end

  def filter_announcements
    filters.each do |filter|
      next if params[filter[:name]] == 'true'

      @announcements = @announcements.where.not(filter[:attribute] => filter[:value])
    end
    @amount = @announcements.count
  end

  def limit_announcements
    @announcements = @announcements.limit(10).offset!(params[:offset])
  end

  def sort_announcements
    @announcements = @announcements.order(sorters[request.headers[:sort]])
  end

  def select_attributes
    @announcements = @announcements.select(
      [*AnnouncementsAttributes::SHOW_FULL, %i[
        views
        status
        visible
        active_until
        created_at
        updated_at
      ]]
    )
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
