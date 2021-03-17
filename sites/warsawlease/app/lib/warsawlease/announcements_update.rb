
module Warsawlease
  module AnnouncementsUpdate
    def edit
      @user ||= ::Queries::User::SingleByAccessToken.new(access_token: request.headers['Access-Token'], site_name: 'Warsawlease' ).call

      @attributes = Announcement.where(id: params[:id]).select(edit_attributes).take.serializable_hash.with_indifferent_access
      return bad_request unless owner?

      @attributes.delete(:user_id)
      @announcement = @attributes
      parse_availability_date
      @response = @announcement
      ok
    end

    def view
      announcement = Announcement.find(params[:id])
      views = announcement.views
      announcement.update_attribute(:views, views + 1)
    end

    def extend_active
      @user ||= ::Queries::User::SingleByAccessToken.new(access_token: request.headers['Access-Token'], site_name: 'Warsawlease' ).call

      announcement = Announcement.find(params[:id])
      return bad_request unless @user.id == announcement.user_id
  
      active_until = Date.today + 60.days
      @response = { active_until: active_until }
      ok if announcement.update_attribute(:active_until, active_until)
    end

    def trigger_visible
      @user ||= ::Queries::User::SingleByAccessToken.new(access_token: request.headers['Access-Token'], site_name: 'Warsawlease' ).call

      announcement = Announcement.find(params[:id])
      return bad_request unless @user.id == announcement.user_id

      ok if announcement.update_attribute(:visible, !announcement.visible)
    end

    private

    def owner?
      @user.id == site::User.find(@attributes[:user_id]).id
    end

    def find_announcement
      @attributes = Announcement.find_by(id: params[:id])
    end

    def prepare_update_object
      @announcement_object = {}
      update!.each do |symbol|
        next if params[symbol].nil?

        @announcement_object[symbol] = params[symbol]
      end
    end

    def update_announcement
      @attributes.update!(@announcement_object)
    end

    def edit_attributes
      AnnouncementsAttributes::EDIT
    end

    def update!
      AnnouncementsAttributes::UPDATE
    end
end
end
