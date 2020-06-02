Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'example.com'
    resource '*',
    headers: %w(Authorization),
    expose: %w(Authorization),
    methods: %i[get post put patch delete]
  end
end
