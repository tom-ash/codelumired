# frozen_string_literal: true

module SiteName
  private

  def site
    @site ||= Object.const_get(constantized_site_name)
  end
end
