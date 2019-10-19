module Responses
  protected

  def something_went_wrong
    { error: 'Something Went Wrong' }
  end

  def render_ok
    render json: camelize_keys, status: 200
  end

  def render_created
    render json: camelize_keys, status: 201
  end

  def render_bad_request
    render json: camelize_keys, status: 400
  end

  def render_401
    render json: camelize_keys, status: 401
  end

  def render_409
    render json: camelize_keys, status: 409
  end

  def render_something_went_wrong
    render json: something_went_wrong, status: 400
  end

  def camelize_keys
    return {} unless @response.present?

    @response.deep_transform_keys do |key|
      key.to_s.camelize(:lower)
    end
  end
end
