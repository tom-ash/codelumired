# frozen_string_literal: true

module Camelize
  private

  def camelize(response)
    response.as_json.deep_transform_keys { |key| key.to_s.camelize(:lower) }
  end
end
