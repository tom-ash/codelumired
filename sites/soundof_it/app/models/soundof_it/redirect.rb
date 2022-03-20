# frozen_string_literal: true

module SoundofIt
  class Redirect < ::Redirect
    establish_connection :soundof_it

    belongs_to :added_by, class_name: '::SoundofIt::User'
  end
end
