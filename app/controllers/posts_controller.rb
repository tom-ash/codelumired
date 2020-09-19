class PostsController < ApplicationController
  include Responses
  include UsersAuthorize
  include UsersVerify
  include UsersCiphers

  def create
    return bad_request unless user_validated?

    post = Post.find_by(name: params[:name]) || Post.new
    post.assign_attributes(
      author_id: @user.id,
      name: params[:name],
      meta: params[:meta],
      url: params[:url],
      title: params[:title],
      body: params[:body]
    )

    post.save!

    render json: post, status: 201
  end

  def show
    render json: {
      'post': Post.find_by(name: params[:name]),
      'scalableVectorGraphics': ScalableVectorGraphic.all
    }
  end
end
