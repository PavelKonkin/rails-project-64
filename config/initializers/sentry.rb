# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://2f8bed9c4e124e40aa353475537a1d92@o4505064341962752.ingest.sentry.io/4505064348844032'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  # config.traces_sampler = lambda do |context|
  #   true
  # end
end
