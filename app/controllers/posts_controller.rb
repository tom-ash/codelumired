class PostsController < ApplicationController
  include Responses
  include UsersAuthorize
  include UsersVerify
  include UsersCiphers

  def create
    return bad_request unless user_validated?

    post = Post.find_by(name: params[:name]) || Post.new

    meta = params[:meta] || {"en": "", "pl": ""}
    url = params[:url] || {"en": "", "pl": ""}
    title = params[:url] || {"en": "", "pl": ""}

    post.assign_attributes(
      author_id: @user.id,
      name: params[:name],
      meta: params[:meta],
      url: params[:url],
      body: params[:body]
    )

    post.save!

    render json: post, status: 201
  end

  def show
    render json: Post.find_by(name: params[:name]).slice(:name, :title, :body).merge(
      scalableVectorGraphics: ScalableVectorGraphic.all
    )
  end
end
