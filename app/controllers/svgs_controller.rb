class SvgsController < ApplicationController
  def index
    render json: SVG.all
  end
end
