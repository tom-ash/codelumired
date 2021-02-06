class RouteDataController < ApplicationController
  include Responses
  include AnnouncementsIndex
  include AnnouncementsShared
  include UsersAuthorize
  include UsersVerify
  include UsersCiphers

  def show
    route_url = request.headers['Route-Url']
    track = request.headers['Track']
    meta_data = {}
    initial_state = nil

    if ['root', 'announcement/index/catalogue'].include?(track)
      search_announcements

      initial_state = {
        announcements: @announcements,
        amount: @announcements.count
      }
    end

    if route_url.match(/^(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)
      # TODO: REWRITE TO SERVICE BEGIN
      @announcement = Announcement.find_by(id: $1)
      return render_404 unless @announcement&.visible?

      @attributes = @announcement.attributes.slice(*AnnouncementsAttributes::SHOW_FULL)
      user = @announcement.user
      @announcement.user_id = nil
      @attributes = @attributes.as_json.with_indifferent_access
      parse_availability_date
      @attributes[:name] = user.showcase['name']
      @attributes[:phone] = user.showcase['phone']
      initial_state = { announcement: @attributes }
      # TODO: REWRITE TO SERVICE END

      meta_data = {
        title: { category: @attributes[:category], district: @attributes[:district], area: @attributes[:area] },
        description: { pl: @attributes[:polish_description], en: @attributes[:english_description] },
        keywords: { category: @attributes[:category], district: @attributes[:district] },
        image: { imageKey: "announcements/#{@attributes[:id]}/#{@attributes[:pictures][0]['database']}" }
      }
    end

    post = nil
    if ['root'].include?(track)
      name = 'welcome'
    elsif ['announcement/create'].include?(track)
      name = 'create_announcement'
    end

    if name
      post_language_variations = Post.where(name: name)
      post = { name: name }

      post_language_variations.each do |language_variation|
        post[language_variation.lang.to_sym] = language_variation.slice(
          :url,
          :body,
          :style,
          :title,
          :description,
          :keywords,
          :canonical_url,
          :picture,
          :meta
        )
      end
    end

    user_validated?
    authorized = @user.present?
    user_data = { 'authorized' => authorized, 'account_type' => nil, 'first_name' => nil, 'business_name' => nil, 'role' => nil }
    user_data.merge!(@user&.attributes&.slice('account_type', 'first_name', 'business_name', 'role')) if authorized

    render json: {
      metaData: meta_data,
      initialState: initial_state,
      pageShow: post,
      svgs: SVG.all,
      user: user_data
    }
  end
end
