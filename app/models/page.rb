# frozen_string_literal: true

class Page < ApplicationRecord
  self.table_name = 'pages'

  def show_link
    "#{root_domain}/#{url}"
  end

  def edit_link
    "#{root_domain}/#{edit_page}/#{url}"
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

  private

  def root_domain
    return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

    'https://www.warsawlease.pl'
  end
end
