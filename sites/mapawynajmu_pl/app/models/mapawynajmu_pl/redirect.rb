# frozen_string_literal: true

module MapawynajmuPl
  class Redirect < ::Redirect
    establish_connection :mapawynajmu_pl

    belongs_to :added_by, class_name: '::MapawynajmuPl::User'
  end
end
