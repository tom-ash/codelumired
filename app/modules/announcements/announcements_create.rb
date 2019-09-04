PARAM_SYMBOLS = %I[ category district net_rent_amount rent_currency additional_fees area rooms floor total_floors
                    availability_date pictures features furnishings polish_description english_description
                    map_latitude map_longitude ]

module AnnouncementsCreate
  def create
    render_400 and return unless user_validated?
    prepare_announcement_object
    handle_availability_date
    create_announcement
    move_pictures
    render_201
  end

  private

  def prepare_announcement_object
    @announcement_object = { user_id: @user.id, active: true, points: 0, views: 0, reports: [],
                             refreshed_at: Time.now }
    @announcement_object.tap do |announcement_object|
      for symbol in PARAM_SYMBOLS
        announcement_object[symbol] = params[symbol]
      end
    end
  end

  def handle_availability_date
    @announcement_object[:availability_date] = Date.current if params[:availability_date] == 'now'
  end

  def create_announcement
    @announcement = Announcement.create(@announcement_object)
  end

  def move_pictures
    for picture in params[:pictures]
      obj = Aws::S3::Object.new(bucket_name: Rails.application.secrets.aws_bucket,
                                key: 'temporary/' + picture[:database], region: Rails.application.secrets.aws_region,
                                credentials: CREDS )
      obj.move_to("#{Rails.application.secrets.aws_bucket}/announcements/#{@announcement.id}/#{picture[:database]}")
    end
  end
end