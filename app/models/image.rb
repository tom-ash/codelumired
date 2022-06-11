# frozen_string_literal: true

class Image < ApplicationRecord
  self.table_name = 'images'

  def edit_link(lang)
    "#{prefix(lang)}/#{storage_key}"
  end

  def prefix(lang)
    { pl: 'obrazy', en: 'images' }[lang.to_sym]
  end
end
