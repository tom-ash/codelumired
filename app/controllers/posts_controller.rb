class PostsController < ApplicationController
  include Responses
  include UsersAuthorize
  include UsersVerify
  include UsersCiphers

  def create
    name = params[:name]
    lang = params[:lang]

    page = Post.find_by(name: name, lang: lang)

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
  end

  def show_by_url
    page = Post.find_by(url: params[:url])
    return render json: {}, status: 404 if page.blank?

    urls = Post.where(name: page.name).pluck(:lang, :url).to_h

    render json: {
      page: page.slice(:name, :url, :body, :style, :title, :description, :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_vers: urls),
      svgs: SVG.all
    }
  end

  def site_map
    lang = request.headers['Language']

    render json: Post.where(lang: lang).distinct.pluck(:url)
  end
end
