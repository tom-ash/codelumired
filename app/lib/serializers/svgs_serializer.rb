class SvgsSerializer
  def initialize(names: [])
    # TODO
  end

  def serialize
    svgs.each_with_object({}) do |svg, serialized_svgs|
      serialized_svgs[svg.name.to_s.camelize(:lower)] = svg.data
    end
  end

  private

  def svgs
    SVG.all
  end
end
