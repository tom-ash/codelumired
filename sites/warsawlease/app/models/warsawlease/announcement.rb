# frozen_string_literal: true

module Warsawlease
  class Announcement < ApplicationRecord
    include ::Warsawlease::AnnouncementModules::Title
    include ::Warsawlease::AnnouncementModules::Keywords
    include ::Warsawlease::AnnouncementModules::Categories
    include ::Warsawlease::AnnouncementModules::Districts

    establish_connection :warsawlease

    self.table_name = 'announcements'

    belongs_to :user, class_name: '::Warsawlease::User'

    before_update :log_changes
    before_destroy :create_deleted_announcement

    validates :status, presence: true
    validates :points, presence: true
    validates :views, presence: true
    validates :category, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..7] }
    validates :district, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..17] }
    validates :area, presence: true, numericality: { only_float: true }
    validates :pictures, presence: true, length: { minimum: 1 }
    validate :pictures_structure
    validates :latitude, presence: true, numericality: { only_float: true }
    validates :longitude, presence: true, numericality: { only_float: true }

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

    def unloggable
      %w[views reports]
    end
  end
end
