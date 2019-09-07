# frozen_string_literal: true

PARAM_SYMBOLS = %I[
  category
  district
  rent_currency
  additional_fees
  rooms
  floor
  total_floors
  availability_date
  pictures
  features
  furnishings
  polish_description
  english_description
  longitude
  latitude
].freeze

module AnnouncementsCreate
  def create
    return render_400 unless user_validated?

    prepare_announcement_object
    calculate_rent_values
    handle_availability_date
    create_announcement
    move_pictures
    render_201
  end

  private

  def prepare_announcement_object
    @announcement_object = preparatory_announcement_object
    @announcement_object.tap do |announcement_object|
      PARAM_SYMBOLS.each do |symbol|
        announcement_object[symbol] = params[symbol]
      end
    end
  end

  def preparatory_announcement_object
    {
      user_id: @user.id,
      status: 1,
      points: 0,
      views: 0,
      reports: [],
      refreshed_at: Date.today,
      history: []
    }
  end

  def calculate_rent_values
    @net_rent_amount = params[:net_rent_amount].to_i
    @gross_rent_amount = @net_rent_amount * 1.23
    @area = params[:area].to_i
    @announcement_object.merge!(
      area: @area,
      net_rent_amount: @net_rent_amount,
      net_rent_amount_per_sqm: ((@net_rent_amount * 100) / @area).ceil,
      gross_rent_amount: @gross_rent_amount.ceil,
      gross_rent_amount_per_sqm: ((@gross_rent_amount * 100) / @area).ceil
    )
  end

  def handle_availability_date
    @announcement_object[:availability_date] = Date.current if params[:availability_date] == 'now'
  end

  def create_announcement
    @announcement = Announcement.create(@announcement_object)
  end

  def move_pictures
    params[:pictures].each do |picture|
      obj = Aws::S3::Object.new(
        bucket_name: Rails.application.secrets.aws_bucket,
        key: 'temporary/' + picture[:database],
        region: Rails.application.secrets.aws_region,
        credentials: CREDS
      )
      obj.move_to("#{Rails.application.secrets.aws_bucket}/announcements/#{@announcement.id}/#{picture[:database]}")
    end
  end
end
