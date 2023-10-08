# frozen_string_literal: true

module MapawynajmuPl
  class ListingDestroyAttemptError < StandardError; end

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

    validates :status, presence: true
    validates :points, presence: true
    validates :views, presence: true
    validates :category, presence: true, numericality: { only_integer: true }, inclusion: { in: [*0..9] }
    validates :area, numericality: { only_float: true }, allow_nil: true
    validates :pictures, presence: true, length: { minimum: 1 }
    validate :pictures_structure
    validates :latitude, presence: true, numericality: { only_float: true }
    validates :longitude, presence: true, numericality: { only_float: true }

    # TODO: Remove public access from pictures of deleted listings.

    def soft_delete!
      update!(deleted_at: Time.now)
    end

    def destroy
      raise ListingDestroyAttemptError
    end

    def destroy!
      raise ListingDestroyAttemptError
    end

    def deleted?
      deleted_at.present?
    end

    private

    def pictures_structure
      errors.add(:pictures, 'invalid pictures structure') if pictures.class != Array
      pictures.each do |picture|
        errors.add(:pictures, 'invalid picture database key length') if picture['database'].length < 8
      end
    end

    def unloggable
      %w[views reports]
    end
  end
end
