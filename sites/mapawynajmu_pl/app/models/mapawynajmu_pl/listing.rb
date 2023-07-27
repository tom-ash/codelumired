# frozen_string_literal: true

module MapawynajmuPl
  class Listing < ApplicationRecord
    include ::MapawynajmuPl::ListingModule::Categories
    include ::MapawynajmuPl::ListingModule::Path
    include ::MapawynajmuPl::ListingModule::Title
    include ::MapawynajmuPl::ListingModule::Keywords
    include ::MapawynajmuPl::ListingModule::Description
    include ::MapawynajmuPl::ListingModule::Image
    include ::MapawynajmuPl::ListingModule::EditPath
    include ::MapawynajmuPl::ListingModule::EditTitle
    include ::MapawynajmuPl::ListingModule::SummaryPath

    establish_connection :mapawynajmu_pl

    self.table_name = 'listings'

    belongs_to :user, class_name: '::MapawynajmuPl::User'

    before_update :log_changes
    before_destroy :create_deleted_announcement

    validates :status, presence: true
    validates :points, presence: true
    validates :views, presence: true
    validates :category, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..9] }
    validates :area, numericality: { only_float: true }, allow_nil: true
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
      @deleted_announcement = DeletedListing.find_by(id: id)
      return @deleted_announcement.update_attribute(original_announcement, self) if @deleted_announcement

      DeletedListing.create(id: id, original_announcement: self)
    end

    def unloggable
      %w[views reports]
    end
  end
end
