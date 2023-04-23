# frozen_string_literal: true

class SvgsSerializer
  def initialize(site:)
    @site = site
  end

  def serialize
    svgs.each_with_object({}) do |svg, serialized_svgs|
      serialized_svgs[svg.name.to_s] = svg.data
    end
  end

  private

  attr_reader :site

  def svgs
    Object.const_get(site)::Svg.all
  end
end
