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
      post = Post.find_or_create_by!(author_id: @user.id, name: name, language: language)
      post.update!(title: post_params[:title], body: post_params[:body])
    end

    post_language_variations = Post.where(name: name)
    post = { name: name }

    post_language_variations.each do |language_variation|
      post[language_variation.language.to_sym] = language_variation.slice(:meta, :url, :title, :body)
    end

    render json: post, status: 201
  end

  def show
    name = params[:name]
    post_language_variations = Post.where(name: name)
    post = { name: name }

    post_language_variations.each do |language_variation|
      post[language_variation.language.to_sym] = language_variation.slice(:meta, :url, :title, :body)
    end

    render json: post.merge(
      scalableVectorGraphics: ScalableVectorGraphic.all
    )
  end
end
