class Announcement < ApplicationRecord
  belongs_to :user
  validates :active, presence: true
  validates :points, presence: true
  validates :views, presence: true
  validates :category, presence: true, numericality: { only_integer: true }
  validates :district, presence: true, numericality: { only_integer: true }
  validates :rent_currency, presence: true, numericality: { only_integer: true }
  validates :net_rent_amount, presence: true, numericality: { only_integer: true }
  validates :additional_fees, inclusion: { in: [true, false] }
  validates :area, presence: true, numericality: { only_integer: true }
  validates :rooms, presence: true, numericality: { only_integer: true }
  validates :floor, presence: true, numericality: { only_integer: true }
  validates :total_floors, presence: true, numericality: { only_integer: true }
  validates :availability_date, presence: true
  validates :pictures, presence: true, length: { minimum: 1 }
  validates :map_latitude, presence: true, numericality: { only_integer: true }
  validates :map_longitude, presence: true, numericality: { only_integer: true }

  def self.create_test_announcements
    50.times do
      floor = [5, 10, 15, 20, 25, 30].shuffle[0]
      @announcement = Announcement.all.shuffle[0]
      @pictures = @announcement.pictures.shuffle

      @new_announcement = Announcement.create({
        user_id: User.all.shuffle[0].id,
        category: [0, 1].shuffle[0],
        district: [*0..16].shuffle[0],
        rent_currency: [0, 1, 2].shuffle[0],
        refreshed_at: Date.today,
        net_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        additional_fees: [true, false].shuffle[0],
        pictures: @pictures,
        area: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].shuffle[0],
        availability_date: ['2019-05-20', '2019-05-25', '2019-06-01', '2019-06-30'].shuffle[0],
        floor: floor,
        total_floors: floor + [5, 10, 15, 20, 25, 30].shuffle[0],
        rooms: [5, 10, 15, 20, 25, 30].shuffle[0],
        map_latitude: [*52198112..52249857].shuffle[0],
        map_longitude: [*20941090..21048526].shuffle[0]
      })

      @new_announcement.errors

      for picture in @pictures
        obj = Aws::S3::Object.new(
          bucket_name: Rails.application.secrets.aws_bucket,
          key: "announcements/#{@announcement.id}/#{picture['database']}",
          region: Rails.application.secrets.aws_region,
          credentials: CREDS
        )
        obj.copy_to("#{Rails.application.secrets.aws_bucket}/announcements/#{@new_announcement.id}/#{picture['database']}")
      end
    end
  end
end
