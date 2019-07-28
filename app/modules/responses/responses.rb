module Responses

  protected

  def something_went_wrong
    { error: 'Something Went Wrong' }
  end

  def render_200 # OK
    render json: @response, status: 200
  end
 
  def render_201 # Created
    render json: @response, status: 201
  end
  
  def render_400 # Bad Request
    render json: @response, status: 400
  end

  def render_401 # Unauthorized 
    render json: @response, status: 401
  end

  def render_something_went_wrong
    render json: something_went_wrong, status: 400
  end

end