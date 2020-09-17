class ScalableVectorGraphicsController < ApplicationController
  def index
    render json: ScalableVectorGraphic.all
  end
end
