# frozen_string_literal: true

module SoundofIt
  class Image < ::Image
    establish_connection :soundof_it
  end
end
