Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.redis = { url: 'redis://redis:6379/0' }
  elsif Rails.env.staging?
    config.redis = { url: 'redis://redis:6379/0' }
  elsif Rails.env.development?
    config.redis = { url: 'redis://redis:6379/0' }
  else
    config.redis = { url: 'redis://redis:6379/0' }
  end
end

Sidekiq.configure_client do |config|
  if Rails.env.production?
    config.redis = { url: 'redis://redis:6379/0' }
  elsif Rails.env.staging?
    config.redis = { url: 'redis://redis:6379/0' }
  elsif Rails.env.development?
    config.redis = { url: 'redis://redis:6379/0' }
  else
    config.redis = { url: 'redis://redis:6379/0' }
  end
end