Sentry.init do |config|
  return unless Rails.env.production?

  config.dsn = 'https://2940536e6132431996571db68fd3a5b1@o876363.ingest.sentry.io/4504761826476032'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
