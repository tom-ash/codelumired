class Announcement < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :points, presence: true
  validates :views, presence: true
  validates :category, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2] }
  validates :district, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..17] }
  validates :rent_currency, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2] }
  validates :gross_rent_amount, presence: true, numericality: { only_float: true }
  validates :gross_rent_amount_per_sqm, presence: true, numericality: { only_float: true }
  validates :area, presence: true, numericality: { only_float: true }
  validates :pictures, presence: true, length: { minimum: 1 }
  validate :pictures_structure
  validates :latitude, presence: true, numericality: { only_float: true }
  validates :longitude, presence: true, numericality: { only_float: true }
  before_update :log_changes
  before_destroy :create_deleted_announcement

  private

  def pictures_structure
    errors.add(:pictures, 'invalid pictures structure') if pictures.class != Array
    pictures.each do |picture|
      errors.add(:pictures, 'invalid picture database key length') if picture['database'].length < 8
    end
  end

  def create_deleted_announcement
    @deleted_announcement = DeletedAnnouncement.find_by(id: id)
    return @deleted_announcement.update_attribute(original_announcement, self) if @deleted_announcement

    DeletedAnnouncement.create(id: id, original_announcement: self)
  end

  def self.create_test_announcements
    10.times do
      floor = [5, 10, 15, 20, 25, 30].shuffle[0]
      @announcement = Announcement.all.shuffle[0]
      @pictures = @announcement.pictures.shuffle

      @new_announcement = Announcement.create({
        status: 1,
        points: 0,
        views: 0,
        reports: [],
        change_log: [],
        visible: true,
        active_until: Date.today + [-30, -12, -6, -1, 0, 1, 2, 4, 8, 12, 16, 18, 22, 26, 30].shuffle[0].days,
        features: [],
        furnishings: [],
        polish_description: '',
        english_description: '',
        user_id: User.all.shuffle[0].id,
        category: [0, 1].shuffle[0],
        district: [*0..16].shuffle[0],
        rent_currency: [0, 1, 2].shuffle[0],
        net_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        net_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        gross_rent_amount: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        gross_rent_amount_per_sqm: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].shuffle[0],
        pictures: @pictures,
        area: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].shuffle[0],
        availability_date: ['2019-05-20', '2019-05-25', '2019-10-01', '2019-11-30'].shuffle[0],
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
