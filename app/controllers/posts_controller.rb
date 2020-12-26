class PostsController < ApplicationController
  include Responses
  include UsersAuthorize
  include UsersVerify
  include UsersCiphers

  def create
    return bad_request unless user_validated?

    allowed_languages = %w[pl en]
    name = params[:name]

    allowed_languages.each do |language|
      post_params = params[language]
      next unless post_params.present?

      url = post_params[:url]
      body = post_params[:body]
      style = post_params[:style]
      title = post_params[:title]
      description = post_params[:description]
      keywords = post_params[:keywords]
      canonical_url = post_params[:canonical_url]
      picture = post_params[:picture]
      meta = post_params[:meta]
      raise ArgumentError unless url.present? && body.present?

      post = Post.find_or_initialize_by(author_id: @user.id, name: name, language: language)
      post.assign_attributes(
        url: url,
        body: body,
        style: style,
        title: title,
        description: description,
        meta: meta,
        keywords: keywords,
        canonical_url: canonical_url,
        picture: picture
      )
      post.save!
    end

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

    render json: post, status: 201
  end

  def show
    name = params[:name]
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

    render json: post.merge(
      scalableVectorGraphics: ScalableVectorGraphic.all
    )
  end

  def show_by_url
    post_from_url = Post.find_by(url: params[:url])
    name = post_from_url&.name
    return render json: {}, status: 404 if name.blank?

    language = post_from_url.language
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

    render json: post.merge(
      scalableVectorGraphics: ScalableVectorGraphic.all,
      language: language
    )
  end
end
