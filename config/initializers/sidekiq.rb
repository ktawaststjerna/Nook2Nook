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

  schedule_file = 'config/schedule.yml'
  if File.exist?(schedule_file)
    scheduled_jobs = YAML.load_file(schedule_file)

    scheduled_jobs.each do |job_name, hash_of_job|
      job = Sidekiq::Cron::Job.new(
        name: job_name,
        cron: hash_of_job['cron'],
        class: hash_of_job['class'],
        queue: hash_of_job['queue']
      )

      job.save if job.valid?
    end
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