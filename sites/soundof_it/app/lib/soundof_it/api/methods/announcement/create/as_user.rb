# frozen_string_literal: true

module SoundofIt
  module Api
    module Methods
      module Announcement
        module Create
          class AsUser < Grape::API
            # before { authorize! }

            # params { use :announcement_attrs }
            post do
              'TEST TEST TEST'

              # announcement_attrs = { user_id: current_user.id, attrs: params[:announcement].merge(confirmed: true) }
              # ::MapawynajmuPl::Commands::Announcement::Create.new(announcement_attrs).call
              # current_user.announcements.last.summary_path(lang)
            end
          end
        end
      end
    end
  end
end
