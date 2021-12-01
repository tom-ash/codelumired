# frozen_string_literal: true

class Page < ApplicationRecord
  self.table_name = 'pages'

  def show_link
    url
  end

  def edit_link
    "#{edit_page}/#{url}"
  end

  def edit_page
    { pl: 'edytuj-strone', en: 'edit-page' }[lang.to_sym]
  end

  def lang_show_links
    lang_urls = {}
    langs.each do |lang|
      page = site::Page.find_by(name: name, lang: lang)
      lang_urls[lang] = page.show_link if page.present?
    end
    lang_urls
  end

  def lang_edit_links
    lang_urls = {}
    langs.each do |lang|
      page = site::Page.find_by(name: name, lang: lang)
      lang_urls[lang] = page.edit_link if page.present?
    end
    lang_urls
  end
end
