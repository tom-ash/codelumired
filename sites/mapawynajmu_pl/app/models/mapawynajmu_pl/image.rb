# frozen_string_literal: true

module MapawynajmuPl
  class Image < ::Image
    establish_connection :mapawynajmu_pl
  end
end
