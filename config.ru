# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application


# Sentry updates

Raven.configure do |config|
  config.dsn = 'https://423cf3eb38de4d739f2f4b14e6e6f949:9ab518ed5d564dbfa1d41fd2ec85c75b@sentry.io/224160'
end
