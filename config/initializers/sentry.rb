Sentry.init do |config|
  config.dsn = 'https://21c5d785943440029a34371f8cdbca32@o876363.ingest.sentry.io/5825780'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
