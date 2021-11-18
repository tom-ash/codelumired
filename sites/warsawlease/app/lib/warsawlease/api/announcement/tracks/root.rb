# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        class Root
          include Warsawlease::Api::Announcement::Tracks::Meta::Root

          def initialize(url:, lang:, params:, current_user:, state:, meta:)
            @url = url
            @lang = lang&.to_sym
            @params = params
            @current_user = current_user
            @state = state
            @meta = meta
          end

          def call
            state.merge!(
              'announcement/index/data': data,
              'announcement/index/inputs': inputs
            )
            meta.merge!(
              title: title,
              keywords: keywords,
              description: description
            )
          end

          private

          attr_reader :url, :params, :lang, :current_user, :state, :meta

          def announcement_filters
            @announcement_filters ||= { area_min: area_min, area_max: area_max }
          end

          def area_min
            @area_min ||= params[:area_min] || params[:powierzchnia_min]
          end

          def area_max
            @area_max ||= params[:area_max] || params[:powierzchnia_max]
          end

          def data
            {
              announcements: serialized_announcements,
              amount: announcements.count,
              current_category: nil
            }
          end

          def inputs
            {
              area_min: area_min.to_s,
              area_max: area_max.to_s,
              area_min_input: area_min.to_s,
              area_max_input: area_max.to_s
            }
          end

          def announcements
            @announcements ||= ::Warsawlease::Queries::Announcement::Index::Visitor.new(announcement_filters).call
          end

          def serialized_announcements
            @serialized_announcements ||= ::Warsawlease::Serializers::Announcement::Index::Visitor.new(announcements).call
          end

          def title
            TITLES[lang]
          end

          def keywords
            KEYWORDS[lang]
          end

          def description
            DESCRIPTIONS[lang]
          end
        end
      end
    end
  end
end
