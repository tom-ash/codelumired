module Responses
  protected

  def ok
    render json: camelized_response, status: 200
  end

  def created
    render json: camelized_response, status: 201
  end

  def bad_request
    render json: camelized_response, status: 400
  end

  def render_401
    render json: camelized_response, status: 401
  end

  def render_404
    render json: camelized_response, status: 404
  end

  def render_409
    render json: camelized_response, status: 409
  end

  def unprocessable_entity
    render json: camelized_response, status: 422
  end

  def camelized_response
    return {} unless @response.present?

    @response.as_json.deep_transform_keys { |key| key.to_s.camelize(:lower) }
  end
end
