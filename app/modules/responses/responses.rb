module Responses
  protected

  def ok
    render json: camelize_keys, status: 200
  end

  def created
    render json: camelize_keys, status: 201
  end

  def bad_request
    render json: camelize_keys, status: 400
  end

  def render_401
    render json: camelize_keys, status: 401
  end

  def render_409
    render json: camelize_keys, status: 409
  end

  def unprocessable_entity
    render json: camelize_keys, status: 422
  end

  def camelize_keys
    return {} unless @response.present?

    @response.deep_transform_keys do |key|
      key.to_s.camelize(:lower)
    end
  end
end
