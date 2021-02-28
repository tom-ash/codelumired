module Sites
  SITES = %w[Warsawlease].freeze

  private

  def site
    @site ||= begin
      SITES.find do |site|
        return Object.const_get(site) if to_s.match?(site)
      end
    end
  end
end
