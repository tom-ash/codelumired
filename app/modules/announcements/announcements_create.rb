# frozen_string_literal: true

module AnnouncementsCreate
  def create
    return render_400 unless user_validated?

    return render_400 unless phone_verified?

    prepare_announcement_object
    handle_rent_amount
    handle_availability_date
    create_announcement
    handle_pictures
    render_201
  end

  private

  def prepare_announcement_object
    @announcement_object = preparatory_announcement_object
    create_attributes.each { |attribute| @announcement_object[attribute] = params[attribute] }
  end

  def preparatory_announcement_object
    {
      user_id: @user.id,
      status: 1,
      distinct: 0,
      points: 0,
      views: 0,
      reports: [],
      visible: true,
      active_until: Date.today + 30.days,
      changelog: []
    }
  end

  def create_announcement
    @announcement = Announcement.create(@announcement_object)
  end

  def create_attributes
    AnnouncementsAttributes::CREATE
  end

  def handle_pictures
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
