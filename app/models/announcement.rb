class Announcement < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :points, presence: true
  validates :views, presence: true
  validates :category, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1] }
  validates :district, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..17] }
  validates :rent_currency, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2] }
  validates :net_rent_amount, presence: true, numericality: { only_integer: true }
  validates :net_rent_amount_per_sqm, presence: true, numericality: { only_integer: true }
  validates :gross_rent_amount, presence: true, numericality: { only_integer: true }
  validates :gross_rent_amount_per_sqm, presence: true, numericality: { only_integer: true }
  validates :additional_fees, inclusion: { in: [true, false] }
  validates :area, presence: true, numericality: { only_integer: true }
  validates :rooms, presence: true, numericality: { only_integer: true }, inclusion: { in: [*-1..99] }
  validates :floor, presence: true, numericality: { only_integer: true }, inclusion: { in: [*-1..99] }
  validates :total_floors, presence: true, numericality: { only_integer: true }, inclusion: { in: [*-1..99] }
  validates :availability_date, presence: true
  validates :pictures, presence: true, length: { minimum: 1 }
  validate :pictures_structure
  validates :latitude, presence: true, numericality: { only_integer: true }
  validates :longitude, presence: true, numericality: { only_integer: true }

  before_update :log_changes

  def pictures_structure
    errors.add(:pictures, 'invalid pictures structure') if pictures.class != Array
    pictures.each do |picture|
      errors.add(:pictures, 'invalid picture database key length') if picture['database'].length != 44
    end
  end

  def self.create_test_announcements
    100.times do
      floor = [5, 10, 15, 20, 25, 30].shuffle[0]
      @announcement = Announcement.all.shuffle[0]
      @pictures = @announcement.pictures.shuffle

      @new_announcement = Announcement.create({
        status: 1,
        points: 0,
        views: 0,
        reports: [],
        history: [],
        features: [],
        furnishings: [],
        polish_description: '',
        english_description: '',
        user_id: User.all.shuffle[0].id,
        category: [0, 1].shuffle[0],
        district: [*0..16].shuffle[0],
        rent_currency: [0, 1, 2].shuffle[0],
        refreshed_at: Date.today,
        net_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        net_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        gross_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        gross_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        additional_fees: [true, false].shuffle[0],
        pictures: @pictures,
        area: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].shuffle[0],
        availability_date: ['2019-05-20', '2019-05-25', '2019-06-01', '2019-06-30'].shuffle[0],
        floor: floor,
        total_floors: floor + [5, 10, 15, 20, 25, 30].shuffle[0],
        rooms: [5, 10, 15, 20, 25, 30].shuffle[0],
        latitude: [*52198112..52249857].shuffle[0],
        longitude: [*20941090..21048526].shuffle[0]
      })

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
