# frozen_string_literal: true

task create_mock_announcements: :environment do
  10.times do
    floor = [5, 10, 15, 20, 25, 30].sample
    @announcement = Announcement.all.sample
    @pictures = @announcement.pictures.shuffle

    @new_announcement = Announcement.create(
      status: 1,
      points: 0,
      views: 0,
      reports: [],
      change_log: [],
      visible: true,
      active_until: Date.today + [-30, -12, -6, -1, 0, 1, 2, 4, 8, 12, 16, 18, 22, 26, 30].sample.days,
      features: [],
      furnishings: [],
      polish_description: '',
      english_description: '',
      user_id: User.all.sample.id,
      category: [0, 1].sample,
      district: [*0..16].sample,
      rent_currency: [0, 1, 2].sample,
      net_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].sample,
      net_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].sample,
      gross_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].sample,
      gross_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].sample,
      pictures: @pictures,
      area: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample,
      availability_date: ['2019-05-20', '2019-05-25', '2019-10-01', '2019-11-30'].sample,
      floor: floor,
      total_floors: floor + [5, 10, 15, 20, 25, 30].sample,
      rooms: [5, 10, 15, 20, 25, 30].sample,
      latitude: [*52198112..52249857].sample/1000000,
      longitude: [*20941090..21048526].sample/1000000
    )

    for picture in @pictures
      obj = Aws::S3::Object.new(
        bucket_name: Rails.application.secrets.aws_bucket,
        key: "announcements/#{@announcement.id}/#{picture['database']}",
        region: Rails.application.secrets.aws_region,
        credentials: CREDS
      )
      obj.copy_to(
        "#{Rails.application.secrets.aws_bucket}/announcements/#{@new_announcement.id}/#{picture['database']}"
      )
    end
  end
end
