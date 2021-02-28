module Codelumi
  class PagesController < Codelumi::ApplicationController
    include Responses
    # include UsersAuthorize
    # include UsersVerify
    # include UsersCiphers

    LANGS = %i[pl en]

    def create
      # FIX
      # return bad_request unless user_validated?

      name = params[:name]
      LANGS.each do |lang|
        Page.create!(
          name: name,
          # author_id: @user.id,
          lang: lang,
          body: [],
          # style: [],
          url: SecureRandom.hex(32),
          # canonical_url: '',
          title: '',
          keywords: '',
          description: '',
          meta: {}
        )
      end

      urls = Page.where(name: name).pluck(:lang, :url).to_h

      render json: { lang_ver_urls: urls }
    end

    def edit
      name = params[:name]
      lang = params[:lang]

      page = Page.find_by(name: name, lang: lang)

      body = params[:body]
      title = params[:title]
      description = params[:description]
      keywords = params[:keywords]
      picture = params[:picture]
      meta = params[:meta]
      url = params[:url]
      canonical_url = params[:canonical_url]

      page.update!(
        body: body,
        title: title,
        description: description,
        keywords: keywords,
        picture: picture,
        meta: meta,
        url: url,
        canonical_url: canonical_url,
        name: name
      )

      ok
    end

    def site_map
      lang = request.headers['Language']

      render json: Page.where(lang: lang).distinct.pluck(:url)
    end
  end
end
