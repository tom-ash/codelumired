class RouteDataController < ApplicationController
  include Responses
  include AnnouncementsIndex
  include AnnouncementsShared

  def show
    route_url = request.headers['Route-Url']
    meta_data = {}
    initial_state = nil

    post = nil
    if ['/', 'en'].include?(route_url)
      name = 'welcome'
    elsif ['dodaj-ogloszenie-wynajmu-nieruchomosci-w-warszawie', 'add-announcement-of-real-estate-lease-in-warsaw'].include?(route_url)
      name = 'create_announcement'
    end

    if name
      post_language_variations = Post.where(name: name)
      post = { name: name }

      post_language_variations.each do |language_variation|
        post[language_variation.language.to_sym] = language_variation.slice(
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

    if ['/', 'en', 'katalog-nieruchomosci-na-wynajem-warszawa', 'catalogue-of-real-estates-for-lease-warsaw'].include?(route_url)
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


      # const image = `${AWS_S3_URL}/announcements/${showData.id}/${showData.pictures[0].database}`

      meta_data = {
        title: { category: @attributes[:category], district: @attributes[:district], area: @attributes[:area] },
        description: { pl: @attributes[:polish_description], en: @attributes[:english_description] },
        keywords: { category: @attributes[:category], district: @attributes[:district] },
        image: { imageKey: "announcements/#{@attributes[:id]}/#{@attributes[:pictures][0]['database']}" }
      }
    end

    render json: {
      metaData: meta_data,
      initialState: initial_state,
      pageShow: post,
      svgs: ScalableVectorGraphic.all
    }
  end
end
