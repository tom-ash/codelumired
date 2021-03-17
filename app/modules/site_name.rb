# frozen_string_literal: true

module SiteName
  private

  def site
    @site ||= Object.const_get(site_name)
  end
end
