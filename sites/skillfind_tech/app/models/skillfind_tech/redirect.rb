# frozen_string_literal: true

module SkillfindTech
  class Redirect < ::Redirect
    establish_connection :skillfind_tech

    belongs_to :added_by, class_name: '::SkillfindTech::User'
  end
end
