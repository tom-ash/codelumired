module Responses
  protected

  def something_went_wrong
    { error: 'Something Went Wrong' }
  end

  def render_200
    render json: @response, status: 200
  end

  def render_201
    render json: @response, status: 201
  end

  def render_400
    render json: @response, status: 400
  end

  def render_401
    render json: @response, status: 401
  end

  def render_something_went_wrong
    render json: something_went_wrong, status: 400
  end
end